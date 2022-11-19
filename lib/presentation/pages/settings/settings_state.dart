import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final bool darkMode;
  final bool celsius;
  final String settingLocalizations;

  const SettingsState(
      {required this.darkMode,
      required this.settingLocalizations,
      required this.celsius});
  SettingsState copyWith(
      {bool? darkMode, String? settingLocalizations, bool? celsius}) {
    return SettingsState(
        celsius: celsius ?? this.celsius,
        darkMode: darkMode ?? this.darkMode,
        settingLocalizations:
            settingLocalizations ?? this.settingLocalizations);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [darkMode, settingLocalizations,celsius];
}
