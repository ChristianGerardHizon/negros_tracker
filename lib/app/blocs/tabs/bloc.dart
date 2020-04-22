/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 5:34 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 5:34 PM
 ******************************************************************************/

import 'package:covidstats/app/blocs/tabs/events.dart';
import 'package:covidstats/app/blocs/tabs/state.dart';
/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 2:02 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 2:02 PM
 ******************************************************************************/
import 'package:flutter_bloc/flutter_bloc.dart';

class TabsBloc extends Bloc<TabsEvent, TabsState> {
  @override
  TabsState get initialState => TabsState(position: 0);

  @override
  Stream<TabsState> mapEventToState(TabsEvent event) async* {
    if (event is TabChanged) {
      yield TabsState(position: event.position);
    }
  }
}
