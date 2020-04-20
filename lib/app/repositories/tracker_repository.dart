/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/20/20 2:02 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/20/20 1:31 PM
 ******************************************************************************/

import 'package:covidstats/app/repositories/tracker_api_client.dart';
import 'package:meta/meta.dart';

class TrackerRepository {
  final TrackerApiClient trackerApiClient;

  TrackerRepository({@required this.trackerApiClient})
      : assert(trackerApiClient != null);
}
