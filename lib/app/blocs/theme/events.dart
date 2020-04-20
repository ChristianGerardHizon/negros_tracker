/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/20/20 3:53 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/20/20 3:53 PM
 ******************************************************************************/

import 'package:covidstats/app/models/themes.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeChanged extends ThemeEvent {
  final ThemeType themeType;

  const ThemeChanged({@required this.themeType}) : assert(themeType != null);

  @override
  List<Object> get props => [themeType];
}
