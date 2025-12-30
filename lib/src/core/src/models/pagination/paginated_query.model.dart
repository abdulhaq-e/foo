import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'cursor_pagination.query.dart';

class PaginatedQuery<TQuery> {
  final TQuery innerQuery;
  final CursorPaginationQuery pagination;

  PaginatedQuery({required this.innerQuery, required this.pagination});
}
