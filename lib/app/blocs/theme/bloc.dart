/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/21/20 4:13 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/21/20 12:53 PM
 ******************************************************************************/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covidstats/app/blocs/theme/state.dart';
import 'package:covidstats/app/models/models.dart';
import 'package:covidstats/app/models/themes.dart';
import 'package:flutter/material.dart';

import 'events.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => _mapThemeChange(ThemeType.dark);

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
          theme: ThemeData.light().copyWith(
            primaryColor: Color(0xff37BC9B),
          ),
          color: Colors.indigo,
        );
        break;
      case ThemeType.dark:
        theme = ThemeState(
          color: Colors.green,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xff283343),
            primaryColor: Color(0xff37BC9B),
          ),
        );
        break;
    }

    return theme;
  }
}
