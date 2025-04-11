// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      dateOfBirth: const DateTimeJsonConverter()
          .fromJson((json['dateOfBirth'] as num).toInt()),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      avatars:
          (json['avatars'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'dateOfBirth': const DateTimeJsonConverter().toJson(instance.dateOfBirth),
      'avatars': instance.avatars,
    };
