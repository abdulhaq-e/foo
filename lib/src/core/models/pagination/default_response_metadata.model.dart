import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'default_response_metadata.model.freezed.dart';
part 'default_response_metadata.model.g.dart';

@Freezed(toJson: false)
abstract class DefaultResponseMetadata with _$DefaultResponseMetadata {
  const factory DefaultResponseMetadata() = _DefaultResponseMetadata;

  factory DefaultResponseMetadata.fromJson(Map<String, Object?> json) =>
      _$DefaultResponseMetadataFromJson(json);
}
