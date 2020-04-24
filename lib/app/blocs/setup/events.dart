// Created by Christian Gerard E. Hizon on 4/24/20 9:08 AM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/24/20 9:08 AM

import 'package:covidstats/app/models/location.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

abstract class SetupEvent extends Equatable {
  const SetupEvent();

  @override
  List<Object> get props => [];
}

class Uninitialized extends SetupEvent {}

class LocationEnabled extends SetupEvent {
  final LocationTypes type;

  LocationEnabled(this.type);

  @override
  List<Object> get props => [type];
}

class SetManualLocation extends SetupEvent {
  final String address;

  SetManualLocation({this.address}) : assert(address != null);

  @override
  List<Object> get props => [address];
}

class SetAutomaticLocation extends SetupEvent {
  final Address address;
  final LocationData location;

  SetAutomaticLocation({this.location, this.address})
      : assert(address != null, location != null);

  @override
  List<Object> get props => [address, location];
}
