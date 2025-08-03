part of 'paginated_query_data.bloc.dart';

@freezed
sealed class PaginatedQueryDataState<Item>
    with _$PaginatedQueryDataState<Item> {
  const factory PaginatedQueryDataState.initial() = PaginatedQueryDataInitial;
  const factory PaginatedQueryDataState.loading() = PaginatedQueryDataLoading;

  const factory PaginatedQueryDataState.loaded({
    required List<Item> items,
    required String? nextPagingKey,
    required String? previousPagingKey,
    required bool hasNextPage,
    required bool hasPreviousPage,
    @Default(false) bool isFetchingNextPage,
    @Default(false) bool isFetchingPreviousPage,
    Object? nextPageError,
    Object? previousPageError,
  }) = PaginatedQueryDataLoaded<Item>;

  const factory PaginatedQueryDataState.error({required Object error}) =
      PaginatedQueryDataError;
}
