/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/21/20 4:13 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/21/20 10:44 AM
 ******************************************************************************/

import 'package:covidstats/app/screens/home/home.dart';
import 'package:covidstats/app/screens/not_found/not_found.dart';
import 'package:covidstats/app/screens/settings/settings.dart';
import 'package:covidstats/app/screens/setup/setup.dart';
import 'package:flutter/material.dart';

class Router {
  static const String initial = SetupPage.route;

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.route:
        return MaterialPageRoute(builder: (_) => HomePage());

      case SettingsPage.route:
        return MaterialPageRoute(builder: (_) => SettingsPage());

      case SetupPage.route:
        return MaterialPageRoute(builder: (_) => SetupPage());

      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
