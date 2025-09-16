// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursor_pagination_metadata.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CursorInput _$CursorInputFromJson(Map<String, dynamic> json) => _CursorInput(
  cursor: json['cursor'] as String,
  direction: $enumDecode(_$PaginationDirectionEnumMap, json['direction']),
);

Map<String, dynamic> _$CursorInputToJson(_CursorInput instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'direction': _$PaginationDirectionEnumMap[instance.direction]!,
    };

const _$PaginationDirectionEnumMap = {
  PaginationDirection.forward: 'forward',
  PaginationDirection.backward: 'backward',
};

_CursorPaginationMetadata _$CursorPaginationMetadataFromJson(
  Map<String, dynamic> json,
) => _CursorPaginationMetadata(
  cursorInput: json['cursorInput'] == null
      ? null
      : CursorInput.fromJson(json['cursorInput'] as Map<String, dynamic>),
  limit: (json['limit'] as num).toInt(),
  nextCursor: json['nextCursor'] as String?,
  previousCursor: json['previousCursor'] as String?,
);

Map<String, dynamic> _$CursorPaginationMetadataToJson(
  _CursorPaginationMetadata instance,
) => <String, dynamic>{
  'cursorInput': instance.cursorInput,
  'limit': instance.limit,
  'nextCursor': instance.nextCursor,
  'previousCursor': instance.previousCursor,
};
