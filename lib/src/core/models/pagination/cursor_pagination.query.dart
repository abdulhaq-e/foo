import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oreed/core/src/models/pagination/cursor_pagination_metadata.model.dart';

part 'cursor_pagination.query.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class CursorPaginationQuery with _$CursorPaginationQuery {
  const factory CursorPaginationQuery({
    @Default(null) CursorInput? cursorInput,
    @Default(30) int limit,
  }) = _CursorPaginationQuery;
}
