
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object?> get props => [];
}

class ThemeLoading extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final ThemeData themeData;

  const ThemeLoaded(this.themeData);

  @override
  List<Object?> get props => [themeData];
}

class ThemeError extends ThemeState {
  final String errorMessage;

  const ThemeError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
