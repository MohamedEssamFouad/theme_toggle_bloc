// theme_event.dart

import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class ToggleTheme extends ThemeEvent {}

class LoadThemePreference extends ThemeEvent {}

class SaveThemePreference extends ThemeEvent {
  final bool isDarkTheme;

  const SaveThemePreference(this.isDarkTheme);

  @override
  List<Object?> get props => [isDarkTheme];
}
