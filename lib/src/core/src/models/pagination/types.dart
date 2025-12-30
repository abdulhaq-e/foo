import 'package:foo/core.dart';

typedef PaginatedQueryHandling<Query, Item>
    = QueryHandling<PaginatedQuery<Query>, PaginatedDataContainer<Item>>;

typedef PageMerger<Item> = List<Item> Function(
    List<Item> currentItems, List<Item> newItems);
