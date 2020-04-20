/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/20/20 2:02 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/20/20 2:00 PM
 ******************************************************************************/

import 'package:covidstats/app/models/themes.dart';
import 'package:covidstats/app/repositories/repositories.dart';
import 'package:covidstats/app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';

class Application extends StatefulWidget {
  final TrackerRepository trackerRepository;

  const Application({Key key, this.trackerRepository})
      : assert(trackerRepository != null),
        super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, ThemeState themeState) {
        BlocProvider.of<ThemeBloc>(context)
            .add(ThemeChanged(themeType: ThemeType.light));
        return MaterialApp(
          title: 'CovidStats',
          theme: themeState.theme,
          initialRoute: Router.initial,
          onGenerateRoute: Router.generateRoute,
        );
      },
    );
  }
}
