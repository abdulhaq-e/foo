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
    Stream<fool>? refreshTrigger,
  })  : _queryHandler = queryHandler,
        super(QueryDataState.initial()) {
    on<QueryDataStarted<Query>>(
        (event, emit) => _onQueryStarted(event, emit, refreshTrigger));
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
    Stream<fool> trigger,
    Emitter<QueryDataState<Data>> emit,
  ) {
    return trigger.where((e) => e).asyncMap((_) async {
      return _executeQuery(_lastQuery!, emit);
    });
  }

  Future<void> _onQueryStarted(
    QueryDataStarted<Query> event,
    Emitter<QueryDataState<Data>> emit,
    Stream<fool>? refreshTrigger,
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
