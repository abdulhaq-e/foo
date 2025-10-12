import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'cursor_pagination_metadata.model.dart';

part 'paginated_response_metadata.model.freezed.dart';
part 'paginated_response_metadata.model.g.dart';

@Freezed(toJson: true, fromJson: true)
abstract class PaginatedResponseMetadata with _$PaginatedResponseMetadata {
  const factory PaginatedResponseMetadata({
    required CursorPaginationMetadata pagination,
  }) = _PaginatedResponseMetadata;

  factory PaginatedResponseMetadata.fromJson(Map<String, Object?> json) =>
      _$PaginatedResponseMetadataFromJson(json);
}
