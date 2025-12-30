import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.model.freezed.dart';
part 'user.model.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String userEntityId,
    required String name,
    required String email,
    required List<String> permissions,
    String? avatarUrl,
    Map<String, dynamic>? additionalData,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
