import 'package:foo/core.dart';

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
