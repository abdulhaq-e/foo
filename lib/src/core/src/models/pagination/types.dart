import 'package:foo/core.dart';

typedef PaginatedQueryHandling<Query, Item> =
    QueryHandling<PaginatedQuery<Query>, PaginatedDataContainer<Item>>;

typedef QueryUpdater<Query> =
    Query Function(
      Query originalQuery,
      String? pagingKey,
      PaginationDirection paginationDirection,
    );

typedef PageMerger<Item> =
    List<Item> Function(List<Item> currentItems, List<Item> newItems);
