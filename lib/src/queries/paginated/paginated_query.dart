import 'package:foo/core.dart';

class CursorPaginatedQuery<Query> {
  final Query query;
  final String? cursor;
  final int numberOfItems;

  CursorPaginatedQuery(Query query, String? cursor, int numberOfItems)
    : query = query,
      cursor = cursor,
      numberOfItems = numberOfItems;
}

class PaginatedQueryData<DataT> {
  final DataT data;
  final bool hasMoreItems;

  PaginatedQueryData(DataT data, bool hasMoreItems)
    : data = data,
      hasMoreItems = hasMoreItems;
}

class CursorPaginatedQueryData<DataT> {
  final DataT data;
  final bool hasMoreItems;
  final String? cursor;

  CursorPaginatedQueryData(DataT data, bool hasMoreItems, String? cursor)
    : data = data,
      hasMoreItems = hasMoreItems,
      cursor = cursor;
}

abstract interface class PaginatedDataAggregator<Data> {
  Data? data;
  Future<Data> aggregate(Data newData);
  Future<Data> reset(Data newData);
}

class CursorPaginatedQueryHandler<Query, Data> {
  final QueryHandling<
    CursorPaginatedQuery<Query>,
    CursorPaginatedQueryData<Data>
  >
  _queryHandler;
  final PaginatedDataAggregator<CursorPaginatedQueryData<Data>> _aggregator;
  CursorPaginatedQueryHandler({
    required QueryHandling<
      CursorPaginatedQuery<Query>,
      CursorPaginatedQueryData<Data>
    >
    queryHandler,
    required PaginatedDataAggregator<CursorPaginatedQueryData<Data>> aggregator,
  }) : _queryHandler = queryHandler,
       _aggregator = aggregator;

  Future<CursorPaginatedQueryData<Data>> call(
    CursorPaginatedQuery<Query> query,
  ) async {
    final newData = await _queryHandler(query);
    return _aggregator.aggregate(newData);
  }
}
