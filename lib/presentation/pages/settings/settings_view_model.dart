import 'package:clean_architecture/core/value/strings.dart';
import 'package:clean_architecture/presentation/pages/settings/settings_state.dart';
import 'package:flutter/material.dart';
import '../../../data/datasources/datalocal/shared_preferences_data.dart';
import '../../../generated/l10n.dart';

class SettingsVM extends ChangeNotifier {
  SettingsState _settingsState = const SettingsState(
      darkMode: false, settingLocalizations: "en", celsius: true);

  SettingsState get settingsState => _settingsState;
  SharedPreference sharedPreference;

  SettingsVM(this.sharedPreference) {
    getSettings();

  }

  Future getSettings() async {
    _settingsState = _settingsState.copyWith(
        darkMode: await sharedPreference.get(Strings.darkTheme) ?? false,
        settingLocalizations:
            await sharedPreference.get(Strings.location) ?? "en");
    S.load(Locale(_settingsState.settingLocalizations));
    notifyListeners();
  }

  Future<void> swapLanguage(String language) async {
    _settingsState = _settingsState.copyWith(settingLocalizations: language);
    sharedPreference.set(Strings.location, _settingsState.settingLocalizations);
    S.load(Locale(_settingsState.settingLocalizations));
    notifyListeners();
  }

  Future<void> swapTheme() async {
    _settingsState =
        _settingsState.copyWith(darkMode: !_settingsState.darkMode);
    sharedPreference.set(Strings.darkTheme, _settingsState.darkMode);
    notifyListeners();
  }

}
