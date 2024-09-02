
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BlocTheme.dart';
import 'EventTheme.dart';
import 'StateTheme.dart';
import 'ThemeSwithcer.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc()..add(LoadThemePreference()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is ThemeLoaded) {
            return MaterialApp(
              theme: state.themeData,
              home: ThemeSwitcherScreen(),
            );
          } else if (state is ThemeError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              home: Scaffold(body: Center(child: Text(state.errorMessage))),
            );
          }


          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}


