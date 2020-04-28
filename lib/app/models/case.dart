// Created by Christian Gerard E. Hizon on 4/28/20 5:05 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 4/28/20 5:04 PM

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Patient extends Equatable {
  final String id;
  final int age;
  final Timestamp date;
  final double latitude;
  final double longitude;
  final String name;
  final String location;
  final String notes;
  final String status;
  final String gender;

  Patient({
    this.age,
    this.id,
    this.date,
    this.latitude,
    this.longitude,
    this.name,
    this.location,
    this.notes,
    this.gender,
    this.status,
  })
      : assert(age != null),
        assert(date != null),
        assert(latitude != null),
        assert(longitude != null),
        assert(name != null),
        assert(id != null),
        assert(gender != null),
        assert(location != null),
        assert(notes != null),
        assert(status != null);

  factory Patient.fromMap(Map map, String id) {
    var lat = map['latitude'];
    var long = map['latitude'];

    if (lat is int) lat = lat.roundToDouble();
    if (long is int) long = long.roundToDouble();
    return Patient(
      id: id,
      name: map['name'],
      date: map['date'],
      gender: map['gender'],
      age: map['age'],
      location: map['location'],
      latitude: lat,
      longitude: long,
      notes: map['notes'],
      status: map['status'],
    );
  }

  @override
  List<Object> get props =>
      [
        age,
        date,
        latitude,
        longitude,
        name,
        notes,
        status,
      ];
}
