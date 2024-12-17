import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:samify/models/settings_model.dart';
import 'dart:convert';

class SettingsProvider with ChangeNotifier {
  SettingsModel _settings = SettingsModel();
  final SharedPreferences _prefs;

  SettingsModel get settings => _settings;

  SettingsProvider(this._prefs) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final settingsJson = _prefs.getString('settings');
    if (settingsJson != null) {
      _settings = SettingsModel.fromJson(
        Map<String, dynamic>.from(
          jsonDecode(settingsJson),
        ),
      );
      notifyListeners();
    }
  }

  Future<void> updateSettings(SettingsModel newSettings) async {
    _settings = newSettings;
    await _prefs.setString(
      'settings',
      const JsonEncoder().convert(newSettings.toJson()),
    );
    notifyListeners();
  }

  Future<void> toggleDarkMode() async {
    final newSettings = _settings.copyWith(darkMode: !_settings.darkMode);
    await updateSettings(newSettings);
  }

  Future<void> toggleOfflineMode() async {
    final newSettings = _settings.copyWith(offlineMode: !_settings.offlineMode);
    await updateSettings(newSettings);
  }

  Future<void> setAudioQuality(String quality) async {
    final newSettings = _settings.copyWith(audioQuality: quality);
    await updateSettings(newSettings);
  }
}