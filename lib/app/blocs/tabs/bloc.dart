/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/23/20 11:45 AM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/23/20 11:45 AM
 ******************************************************************************/

import 'package:covidstats/app/blocs/tabs/events.dart';
import 'package:covidstats/app/blocs/tabs/state.dart';
import 'package:covidstats/app/screens/dashboard/dashboard.dart';
import 'package:covidstats/app/screens/map/map.dart';
import 'package:covidstats/app/screens/provincial/provincial.dart';
/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 2:02 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 2:02 PM
 ******************************************************************************/
import 'package:flutter_bloc/flutter_bloc.dart';

class TabsBloc extends Bloc<TabsEvent, TabsState> {
  @override
  TabsState get initialState => _mapThemeChange(0);

  @override
  Stream<TabsState> mapEventToState(TabsEvent event) async* {
    if (event is TabChanged) {
      yield _mapThemeChange(event.position);
    }
  }

  TabsState _mapThemeChange(int position) {
    TabsState state;

    switch (position) {
      case 0:
        state = TabsState(currentTab: MapPage(), position: position);
        break;
      case 1:
        state = TabsState(currentTab: DashboardPage(), position: position);
        break;
      case 2:
        state = TabsState(currentTab: ProvincialPage(), position: position);
        break;
    }
    return state;
  }
}
