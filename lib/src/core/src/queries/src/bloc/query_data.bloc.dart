import 'package:bloc/bloc.dart';
import 'package:foo/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_data.bloc.freezed.dart';
part 'query_data.events.dart';
part 'query_data.state.dart';

class QueryDataBloc<Query, Data>
    extends Bloc<QueryDataEvent, QueryDataState<Data>> {
  final QueryHandling<Query, Data> _queryHandler;
  Query? _lastQuery;

  QueryDataBloc({
    required QueryHandling<Query, Data> queryHandler,
    Stream<void>? refreshTrigger,
  })  : _queryHandler = queryHandler,
        super(QueryDataState.initial()) {
    on<QueryDataStarted<Query>>(
        (event, emit) => _onQueryStarted(event, emit, refreshTrigger));
    on<QueryDataRefreshed>(_onRefreshed);
  }

  Future<void> _onRefreshed(
    QueryDataRefreshed event,
    Emitter<QueryDataState<Data>> emit,
  ) async {
    final query = _lastQuery;
    if (query == null) return;
    if (state is! QueryDataLoaded<Data>) {
      emit(await _executeQuery(query, emit));
      return;
    }

    try {
      final data = await _queryHandler(query);
      // A newer QueryDataStarted owns the state now — its result, not this
      // stale one, is what the view should end on.
      if (identical(query, _lastQuery)) {
        emit(QueryDataState<Data>.loaded(data: data));
      }
    } catch (_) {
      // Keep showing what we have; a quiet refresh never blanks the view.
    }
  }

  Future<QueryDataState<Data>> _executeQuery(
    Query query,
    Emitter<QueryDataState<Data>> emit,
  ) async {
    emit(QueryDataState<Data>.loading());
    try {
      final data = await _queryHandler(query);
      return QueryDataState<Data>.loaded(data: data);
    } catch (error) {
      return QueryDataState<Data>.failedLoading();
    }
  }

  Stream<QueryDataState<Data>> _mapTrigger(
    Stream<void> trigger,
    Emitter<QueryDataState<Data>> emit,
  ) {
    return trigger.asyncMap((_) async {
      return _executeQuery(_lastQuery!, emit);
    });
  }

  Future<void> _onQueryStarted(
    QueryDataStarted<Query> event,
    Emitter<QueryDataState<Data>> emit,
    Stream<void>? refreshTrigger,
  ) async {
    _lastQuery = event.query;

    // Initial load
    final initialState = await _executeQuery(event.query, emit);
    emit(initialState);

    // Setup refresh listener if provided
    if (refreshTrigger != null) {
      await emit.forEach(_mapTrigger(refreshTrigger, emit), onData: (d) => d);
    }
  }
}
