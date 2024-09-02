import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BlocTheme.dart';
import 'EventTheme.dart';

class ThemeSwitcherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switcher App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            themeBloc.add(ToggleTheme());
          },
          child: const Text('Toggle Theme'),
        ),
      ),
    );
  }
}