import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_project/core/utils/json_catalog.dart';
import 'package:test_project/features/profile/entities/user_profile.dart';

class ProfileLocalDataSource {
  Future<UserProfile> loadProfile() async {
    final jsonString = await rootBundle.loadString(JsonCatalog.profileJson);
    final jsonMap = json.decode(jsonString);
    return UserProfile.fromJson(jsonMap);
  }
}
