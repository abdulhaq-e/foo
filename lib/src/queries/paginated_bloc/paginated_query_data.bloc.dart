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
  final QueryUpdater<Query> _updateQueryWithPagingKey;
  final PageMerger<Item> _onNextPageResult;
  final PageMerger<Item> _onPreviousPageResult;

  Query? _initialQuery;

  PaginatedQueryDataBloc({
    required PaginatedQueryHandling<Query, Item> queryHandler,
    required QueryUpdater<Query> updateQueryWithPagingKey,
    PageMerger<Item>? onNextPageResult,
    PageMerger<Item>? onPreviousPageResult,
  })  : _queryHandler = queryHandler,
        _updateQueryWithPagingKey = updateQueryWithPagingKey,
        _onNextPageResult =
            onNextPageResult ?? PageMergingStrategies.mergeByReplacement,
        _onPreviousPageResult =
            onPreviousPageResult ?? PageMergingStrategies.mergeByReplacement,
        super(const PaginatedQueryDataState.initial()) {
    on<PaginatedQueryStarted<Query>>(_onStarted);
    on<PaginatedQueryNextPageRequested>(_onNextPageRequested);
    on<PaginatedQueryPreviousPageRequested>(_onPreviousPageRequested);
  }

  Future<void> _onStarted(
    PaginatedQueryStarted<Query> event,
    Emitter<PaginatedQueryDataState<Item>> emit,
  ) async {
    _initialQuery = event.query;
    emit(const PaginatedQueryDataState.loading());
    try {
      final dataContainer = await _queryHandler(event.query);
      emit(
        PaginatedQueryDataState.loaded(
          items: dataContainer.data,
          nextPagingKey: dataContainer.metadata.pagination.nextCursor,
          previousPagingKey: dataContainer.metadata.pagination.previousCursor,
          hasNextPage: dataContainer.metadata.pagination.nextCursor != null,
          hasPreviousPage:
              dataContainer.metadata.pagination.previousCursor != null,
        ),
      );
    } catch (e) {
      emit(PaginatedQueryDataState.error(error: e));
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
      final nextQuery = _updateQueryWithPagingKey(
        _initialQuery!,
        currentState.nextPagingKey,
        PaginationDirection.forward,
      );
      final dataContainer = await _queryHandler(nextQuery);
      final newItems =
          _onNextPageResult(currentState.items, dataContainer.data);
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
      final prevQuery = _updateQueryWithPagingKey(
        _initialQuery!,
        loadedState.previousPagingKey,
        PaginationDirection.backward,
      );
      final dataContainer = await _queryHandler(prevQuery);
      final newItems =
          _onPreviousPageResult(loadedState.items, dataContainer.data);
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
