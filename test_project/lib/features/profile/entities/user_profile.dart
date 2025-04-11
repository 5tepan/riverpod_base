import 'package:json_annotation/json_annotation.dart';
import 'package:test_project/core/utils/custom_json_formatters.dart';

part 'user_profile.g.dart';

@JsonSerializable()
@DateTimeJsonConverter()
class UserProfile {
  final String name;
  final String email;
  final String phone;
  final DateTime dateOfBirth;
  final List<String> avatars;

  UserProfile({
    required this.dateOfBirth,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatars,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
