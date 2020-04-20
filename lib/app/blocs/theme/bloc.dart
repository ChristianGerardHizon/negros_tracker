/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/20/20 4:11 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/20/20 2:20 PM
 ******************************************************************************/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covidstats/app/blocs/theme/state.dart';
import 'package:covidstats/app/models/themes.dart';
import 'package:flutter/material.dart';

import 'events.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeState(
        theme: ThemeData.light(),
        color: Colors.red,
      );

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeChanged) {
      yield _mapThemeChange(event.themeType);
    }
  }

  ThemeState _mapThemeChange(ThemeType type) {
    ThemeState theme;

    switch (type) {
      case ThemeType.light:
        theme = ThemeState(
          theme: ThemeData(
            primaryColor: Colors.indigoAccent,
          ),
          color: Colors.indigo,
        );
        break;
      case ThemeType.dark:
        theme = ThemeState(
          theme: ThemeData(
            primaryColor: Colors.indigoAccent,
          ),
          color: Colors.indigo,
        );
        break;
    }

    return theme;
  }
}
