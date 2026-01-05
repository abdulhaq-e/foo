// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_status.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OperationStatus _$OperationStatusFromJson(Map<String, dynamic> json) =>
    _OperationStatus(
      status: $enumDecode(_$OperationStatusValueEnumMap, json['status']),
      data: json['data'] as Map<String, dynamic>?,
      error: json['error'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$OperationStatusToJson(_OperationStatus instance) =>
    <String, dynamic>{
      'status': _$OperationStatusValueEnumMap[instance.status]!,
      'data': instance.data,
      'error': instance.error,
    };

const _$OperationStatusValueEnumMap = {
  OperationStatusValue.pending: 'pending',
  OperationStatusValue.success: 'success',
  OperationStatusValue.failed: 'failed',
};
