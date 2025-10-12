// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response_metadata.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedResponseMetadata _$PaginatedResponseMetadataFromJson(
  Map<String, dynamic> json,
) => _PaginatedResponseMetadata(
  pagination: CursorPaginationMetadata.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PaginatedResponseMetadataToJson(
  _PaginatedResponseMetadata instance,
) => <String, dynamic>{'pagination': instance.pagination};
