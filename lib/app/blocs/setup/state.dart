// Created by Christian Gerard E. Hizon on 4/24/20 9:24 AM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 9:15 AM

import 'package:covidstats/app/models/location.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

abstract class SetupState extends Equatable {
  @override
  List<Object> get props => [];
}

class SetupUninitialized extends SetupState {}

class SetupLoading extends SetupState {}

class SetupLocationAllowed extends SetupState {
  final LocationTypes type;

  SetupLocationAllowed(this.type);

  @override
  List<Object> get props => [type];
}

class SetupLocationDisabled extends SetupState {}

class SetupManualLocationInitialized extends SetupState {
  final String address;

  SetupManualLocationInitialized({this.address}) : assert(address != null);

  @override
  List<Object> get props => [address];
}

class SetupAutomaticLocationInitialized extends SetupState {
  final Address address;
  final LocationData location;

  SetupAutomaticLocationInitialized({this.location, this.address})
      : assert(address != null);

  @override
  List<Object> get props => [address, location];
}
