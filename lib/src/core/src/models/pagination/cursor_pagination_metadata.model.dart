import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cursor_pagination_metadata.model.freezed.dart';
part 'cursor_pagination_metadata.model.g.dart';

enum PaginationDirection { forward, backward }

@Freezed(toJson: false)
abstract class CursorInput with _$CursorInput {
  const factory CursorInput({
    required String cursor,
    required PaginationDirection direction,
  }) = _CursorInput;

  factory CursorInput.fromJson(Map<String, Object?> json) =>
      _$CursorInputFromJson(json);
}

@Freezed(toJson: false)
abstract class CursorPaginationMetadata with _$CursorPaginationMetadata {
  const factory CursorPaginationMetadata({
    required CursorInput? cursorInput,
    required int limit,
    required String? nextCursor,
    required String? previousCursor,
  }) = _CursorPaginationMetadata;

  factory CursorPaginationMetadata.fromJson(Map<String, Object?> json) =>
      _$CursorPaginationMetadataFromJson(json);
}
