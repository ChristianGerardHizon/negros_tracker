/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 2:44 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 2:44 PM
 ******************************************************************************/

import 'package:covidstats/app/blocs/tabs/events.dart';
import 'package:covidstats/app/blocs/tabs/state.dart';

/*******************************************************************************
 * Created by Christian Gerard E. Hizon on 4/22/20 2:02 PM
 * Copyright (c) 2020 . All rights reserved.
 * Last modified 4/22/20 2:02 PM
 ******************************************************************************/
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBloc extends Bloc<TabsEvent, TabState> {
  @override
  TabState get initialState => TabState(position: 0);

  @override
  Stream<TabState> mapEventToState(TabsEvent event) async* {
    if (event is TabChanged) {
      yield TabState(position: event.position);
    }
  }
}
