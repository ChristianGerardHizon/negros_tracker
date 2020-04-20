/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/20/20 2:03 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/20/20 1:08 PM
 ******************************************************************************/

import 'package:covidstats/app/screens/home/home.dart';
import 'package:covidstats/app/screens/not_found/not_found.dart';
import 'package:covidstats/app/screens/settings/settings.dart';
import 'package:flutter/material.dart';

class Router {
  static const String initial = HomePage.route;

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.route:
        return MaterialPageRoute(builder: (_) => HomePage());

      case SettingsPage.route:
        return MaterialPageRoute(builder: (_) => SettingsPage());

      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
