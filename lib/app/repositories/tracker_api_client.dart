/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/20/20 2:02 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/20/20 1:20 PM
 ******************************************************************************/

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class TrackerApiClient {
  static const String baseUrl = '';
  final Dio dio;

  TrackerApiClient({@required this.dio}) : assert(dio != null);
}
