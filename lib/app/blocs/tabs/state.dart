/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 2:44 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 2:21 PM
 ******************************************************************************/

import 'package:equatable/equatable.dart';

class TabState extends Equatable {
  final int position;

  TabState({this.position}) : assert(position != null);

  @override
  List<Object> get props => null;
}
