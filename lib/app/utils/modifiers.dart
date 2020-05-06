// Created by Christian Gerard E. Hizon on 5/6/20 6:09 PM
// Copyright (c) 2020 . All rights reserved.
// Last modified 5/6/20 5:38 PM

import 'dart:ui';

import 'package:flutter/material.dart';

class Modifiers {
  static capitalize(String str) {
    if (str != null && str.length > 1) {
      return '${str[0].toUpperCase()}${str.substring(1)}';
    } else {
      return str;
    }
  }

  static coloPicker(String status) {
    var yellow = Color(0xffFBD168);
    var green = Color(0xff37BC9B);
    var red = Colors.redAccent;
    var base = Colors.grey;
    var white = Colors.white;

    switch (status) {
      case 'positive':
        return yellow;
      case 'recovered':
      case 'recover':
        return green;
      case 'expired':
      case 'dead':
        return red;
      case 'normal':
        return white;
      default:
        return base;
    }
  }
}
