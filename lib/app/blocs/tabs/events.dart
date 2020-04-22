/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 2:44 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 2:44 PM
 ******************************************************************************/

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class TabsEvent extends Equatable {
  const TabsEvent();
}

class TabChanged extends TabsEvent {
  final int position;

  const TabChanged({@required this.position}) : assert(position != null);

  @override
  List<Object> get props => [position];
}
