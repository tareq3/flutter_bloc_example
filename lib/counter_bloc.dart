//file name counter_bloc created at 1:16 PM by tareq

import 'package:flutter_bloc/flutter_bloc.dart';

enum COUNTER_EVENTS{
  increment, decrement
}

class CounterBloc extends Bloc<COUNTER_EVENTS, dynamic>{

  CounterBloc(initialState) : super(initialState);

  @override
  Stream mapEventToState(COUNTER_EVENTS event) async* {
    // TODO: implement mapEventToState
    switch(event ){
      case COUNTER_EVENTS.increment:
        yield state +1;
        return;
      case COUNTER_EVENTS.decrement:
        yield state -1;
        return;
    }
  }

}