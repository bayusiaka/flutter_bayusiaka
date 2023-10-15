import 'package:flutter_latihanbloc/bloc/counter_event.dart';
import 'package:flutter_latihanbloc/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(CounterState(0)) {
    on<Increment.((event, emit)) => emit(CounterState(state.value + 1))
  }
}