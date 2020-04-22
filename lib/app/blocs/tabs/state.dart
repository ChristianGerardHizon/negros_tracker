/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 5:34 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 5:31 PM
 ******************************************************************************/

import 'package:equatable/equatable.dart';

class TabsState extends Equatable {
  final int position;

  TabsState({this.position}) : assert(position != null);

  @override
  List<Object> get props => [position];
}
