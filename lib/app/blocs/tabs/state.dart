/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/23/20 11:45 AM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/23/20 11:13 AM
 ******************************************************************************/

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class TabsState extends Equatable {
  final Widget currentTab;
  final int position;

  TabsState({this.position, this.currentTab}) : assert(currentTab != null);

  @override
  List<Object> get props => [currentTab, position];
}
