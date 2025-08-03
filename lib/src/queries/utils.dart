import 'package:foo/core.dart';
import 'package:foo/queries.dart';

String _paginationDirectionQueryParamValue(PaginationDirection direction) {
  return switch (direction) {
    PaginationDirection.forward => 'forward',
    PaginationDirection.backward => 'backward',
  };
}

Map<String, String> buildPaginationQueryParams(
  CursorPaginationQuery paginationQuery,
) {
  final queryParams = <String, String>{};

  queryParams['limit'] = paginationQuery.limit.toString();
  final cursorInput = paginationQuery.cursorInput;
  if (cursorInput != null) {
    queryParams['cursor'] = cursorInput.cursor;
    queryParams['direction'] = _paginationDirectionQueryParamValue(
      cursorInput.direction,
    );
  }

  return queryParams;
}

CursorPaginationQuery buildNewPaginationQuery(
  String? pagingKey,
  PaginationDirection paginationDirection,
  CursorPaginationQuery existingPaginationQuery,
) {
  CursorInput? cursorInput;

  if (pagingKey != null) {
    cursorInput = CursorInput(
      cursor: pagingKey,
      direction: paginationDirection,
    );
  }

  return existingPaginationQuery.copyWith(cursorInput: cursorInput);
}

PaginatedQueryHandling<Query, Item> wrapQueryHandler<Query, Item>(
  QueryHandling<Query, PaginatedDataContainer<Item>> queryHandler,
) {
  Future<DataPage<Item>> paginatedQuery(Query query) async {
    final paginatedData = await queryHandler(query);
    return DataPage.fromPaginatedDataContainer(paginatedData);
  }

  return paginatedQuery;
}
