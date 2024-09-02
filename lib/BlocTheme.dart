
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'EventTheme.dart';
import 'StateTheme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeLoading()) {
    on<ToggleTheme>(_onToggleTheme);
    on<LoadThemePreference>(_onLoadThemePreference);
    on<SaveThemePreference>(_onSaveThemePreference);
  }

  void _onToggleTheme(ToggleTheme event, Emitter<ThemeState> emit) async {
    if (state is ThemeLoaded) {
      final currentState = state as ThemeLoaded;
      final isDarkTheme = currentState.themeData == ThemeData.dark();
      final newTheme = isDarkTheme ? ThemeData.light() : ThemeData.dark();
      emit(ThemeLoaded(newTheme));

      add(SaveThemePreference(!isDarkTheme));
    }
  }

  void _onLoadThemePreference(LoadThemePreference event, Emitter<ThemeState> emit) async {
    try {
      emit(ThemeLoading());


      final prefs = await SharedPreferences.getInstance();
      final isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
      final themeData = isDarkTheme ? ThemeData.dark() : ThemeData.light();

      emit(ThemeLoaded(themeData));
    } catch (e) {
      emit(const ThemeError('Failed to load theme preference'));
    }
  }

  void _onSaveThemePreference(SaveThemePreference event, Emitter<ThemeState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDarkTheme', event.isDarkTheme);
    } catch (e) {
      emit(ThemeError('Failed to save theme preference'));
    }
  }
}
