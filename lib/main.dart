// Created by Christian Gerard E. Hizon on 4/24/20 9:08 AM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 9:08 AM

import 'package:covidstats/app/app.dart';
import 'package:covidstats/app/blocs/setup/bloc.dart';
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
      BlocProvider<SetupBloc>(
        create: (context) => SetupBloc(),
      ),
    ],
    child: Application(
      trackerRepository: trackerRepository,
    ),
  ));
}
