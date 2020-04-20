/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/20/20 4:12 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/20/20 4:12 PM
 ******************************************************************************/

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ThemeState extends Equatable {
  final ThemeData theme;
  final MaterialColor color;

  const ThemeState({@required this.theme, @required this.color})
      : assert(theme != null),
        assert(color != null);

  @override
  List<Object> get props => [theme, color];
}
