/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 5:34 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 5:10 PM
 ******************************************************************************/

import 'package:covidstats/app/app.dart';
import 'package:covidstats/app/blocs/tabs/bloc.dart';
import 'package:covidstats/app/repositories/repositories.dart';
import 'package:covidstats/app/repositories/tracker_repository.dart';
import 'package:covidstats/app_bloc_delegate.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/blocs/blocs.dart';

void main() {
  final TrackerRepository trackerRepository = TrackerRepository(
    trackerApiClient: TrackerApiClient(
      dio: Dio(),
    ),
  );

  BlocSupervisor.delegate = AppBlocDelegate();

  return runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
      ),
      BlocProvider<TabsBloc>(
        create: (context) => TabsBloc(),
      ),
    ],
    child: Application(
      trackerRepository: trackerRepository,
    ),
  ));
}
