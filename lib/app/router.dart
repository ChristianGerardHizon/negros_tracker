// Created by Christian Gerard E. Hizon on 4/24/20 4:51 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 2:35 PM

import 'package:covidstats/app/screens/case/case.dart';
/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 12:48 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/21/20 4:16 PM
 ******************************************************************************/

import 'package:covidstats/app/screens/home/home.dart';
import 'package:covidstats/app/screens/not_found/not_found.dart';
import 'package:covidstats/app/screens/settings/settings.dart';
import 'package:covidstats/app/screens/setup/setup.dart';
import 'package:covidstats/app/screens/tabs/tabs.dart';
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

      case TabsPage.route:
        return MaterialPageRoute(builder: (_) => TabsPage());

      case CasePage.route:
        return MaterialPageRoute(builder: (_) => CasePage());


      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
