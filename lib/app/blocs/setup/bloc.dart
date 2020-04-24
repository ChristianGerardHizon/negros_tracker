// Created by Christian Gerard E. Hizon on 4/24/20 9:24 AM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 9:15 AM

import 'package:covidstats/app/blocs/setup/events.dart';
import 'package:covidstats/app/blocs/setup/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupBloc extends Bloc<SetupEvent, SetupState> {
  @override
  SetupState get initialState => SetupUninitialized();

  @override
  Stream<SetupState> mapEventToState(SetupEvent event) async* {
    if (event is LocationEnabled) {
      yield SetupLoading();
      yield SetupLocationAllowed(event.type);
    }

    if (event is SetManualLocation) {
      yield SetupManualLocationInitialized(
        address: event.address,
      );
    }

    if (event is SetAutomaticLocation) {
      yield SetupAutomaticLocationInitialized(
        address: event.address,
        location: event.location,
      );
    }
  }
}
