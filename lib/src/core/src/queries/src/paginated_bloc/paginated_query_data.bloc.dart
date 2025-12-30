import 'package:bloc/bloc.dart';
import 'package:foo/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import './page_merging_strategies.dart';

part 'paginated_query_data.bloc.freezed.dart';
part 'paginated_query_data.events.dart';
part 'paginated_query_data.state.dart';

class PaginatedQueryDataBloc<Query, Item>
    extends Bloc<PaginatedQueryDataEvent, PaginatedQueryDataState<Item>> {
  final PaginatedQueryHandling<Query, Item> _queryHandler;
  final PageMerger<Item> _onNextPageResult;
  final PageMerger<Item> _onPreviousPageResult;

  Query? _initialQuery;
  int _pageSize = 30;

  PaginatedQueryDataBloc({
    required PaginatedQueryHandling<Query, Item> queryHandler,
    EventTransformer<PaginatedQueryStarted<Query>>? startedEventTransformer,
    PageMerger<Item>? onNextPageResult,
    PageMerger<Item>? onPreviousPageResult,
    Stream<void>? refreshTrigger,
  }) : _queryHandler = queryHandler,
       _onNextPageResult =
           onNextPageResult ?? PageMergingStrategies.mergeByReplacement,
       _onPreviousPageResult =
           onPreviousPageResult ?? PageMergingStrategies.mergeByReplacement,
       super(const PaginatedQueryDataState.initial()) {
    on<PaginatedQueryStarted<Query>>(
      (event, emit) => _onStarted(event, emit, refreshTrigger),
      transformer: startedEventTransformer,
    );
    on<PaginatedQueryNextPageRequested>(_onNextPageRequested);
    on<PaginatedQueryPreviousPageRequested>(_onPreviousPageRequested);
  }

  /// Creates a paginated query wrapper from the business query and pagination params
  PaginatedQuery<Query> _createPaginatedQuery({
    String? cursor,
    PaginationDirection? direction,
  }) {
    return PaginatedQuery(
      innerQuery: _initialQuery!,
      pagination: CursorPaginationQuery(
        cursorInput: cursor != null && direction != null
            ? CursorInput(cursor: cursor, direction: direction)
            : null,
        limit: _pageSize,
      ),
    );
  }

  Future<PaginatedQueryDataState<Item>> _executeInitialQuery(
    Emitter<PaginatedQueryDataState<Item>> emit,
  ) async {
    emit(const PaginatedQueryDataState.loading());
    try {
      final paginatedQuery = _createPaginatedQuery();
      final dataContainer = await _queryHandler(paginatedQuery);
      return PaginatedQueryDataState.loaded(
        items: dataContainer.data,
        nextPagingKey: dataContainer.metadata.pagination.nextCursor,
        previousPagingKey: dataContainer.metadata.pagination.previousCursor,
        hasNextPage: dataContainer.metadata.pagination.nextCursor != null,
        hasPreviousPage:
            dataContainer.metadata.pagination.previousCursor != null,
      );
    } catch (e) {
      return PaginatedQueryDataState.error(error: e);
    }
  }

  Stream<PaginatedQueryDataState<Item>> _mapTrigger(
    Stream<void> trigger,
    Emitter<PaginatedQueryDataState<Item>> emit,
  ) {
    return trigger.asyncMap((_) async {
      return _executeInitialQuery(emit);
    });
  }

  Future<void> _onStarted(
    PaginatedQueryStarted<Query> event,
    Emitter<PaginatedQueryDataState<Item>> emit,
    Stream<void>? refreshTrigger,
  ) async {
    _initialQuery = event.query;
    _pageSize = event.pageSize;

    // Initial load
    final initialState = await _executeInitialQuery(emit);
    emit(initialState);

    // Setup refresh listener if provided
    if (refreshTrigger != null) {
      await emit.forEach(_mapTrigger(refreshTrigger, emit), onData: (d) => d);
    }
  }

  Future<void> _onNextPageRequested(
    PaginatedQueryNextPageRequested event,
    Emitter<PaginatedQueryDataState<Item>> emit,
  ) async {
    // We need to use 'state as' to access the properties of the loaded state
    final currentState = state;
    if (currentState is! PaginatedQueryDataLoaded<Item>) return;

    if (currentState.isFetchingNextPage || !currentState.hasNextPage) return;

    emit(currentState.copyWith(isFetchingNextPage: true, nextPageError: null));

    try {
      final paginatedQuery = _createPaginatedQuery(
        cursor: currentState.nextPagingKey,
        direction: PaginationDirection.forward,
      );
      final dataContainer = await _queryHandler(paginatedQuery);
      final newItems = _onNextPageResult(
        currentState.items,
        dataContainer.data,
      );
      emit(
        currentState.copyWith(
          items: newItems,
          nextPagingKey: dataContainer.metadata.pagination.nextCursor,
          previousPagingKey: dataContainer.metadata.pagination.previousCursor,
          hasNextPage: dataContainer.metadata.pagination.nextCursor != null,
          hasPreviousPage:
              dataContainer.metadata.pagination.previousCursor != null,
          isFetchingNextPage: false,
        ),
      );
    } catch (e) {
      emit(currentState.copyWith(isFetchingNextPage: false, nextPageError: e));
    }
  }

  Future<void> _onPreviousPageRequested(
    PaginatedQueryPreviousPageRequested event,
    Emitter<PaginatedQueryDataState<Item>> emit,
  ) async {
    if (state is! PaginatedQueryDataLoaded<Item>) return;

    final loadedState = state as PaginatedQueryDataLoaded<Item>;
    if (loadedState.isFetchingPreviousPage || !loadedState.hasPreviousPage)
      return;

    emit(loadedState.copyWith(isFetchingPreviousPage: true));

    try {
      final paginatedQuery = _createPaginatedQuery(
        cursor: loadedState.previousPagingKey,
        direction: PaginationDirection.backward,
      );
      final dataContainer = await _queryHandler(paginatedQuery);
      final newItems = _onPreviousPageResult(
        loadedState.items,
        dataContainer.data,
      );
      emit(
        loadedState.copyWith(
          items: newItems,
          nextPagingKey: dataContainer.metadata.pagination.nextCursor,
          previousPagingKey: dataContainer.metadata.pagination.previousCursor,
          hasNextPage: dataContainer.metadata.pagination.nextCursor != null,
          hasPreviousPage:
              dataContainer.metadata.pagination.previousCursor != null,
          isFetchingPreviousPage: false,
        ),
      );
    } catch (e) {
      emit(loadedState.copyWith(isFetchingPreviousPage: false));
    }
  }
}
