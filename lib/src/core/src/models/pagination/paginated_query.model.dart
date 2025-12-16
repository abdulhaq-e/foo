import 'cursor_pagination.query.dart';

class PaginatedQuery<Query> {
  const PaginatedQuery({required this.query, required this.pagination});
  final Query query;
  final CursorPaginationQuery pagination;
}
