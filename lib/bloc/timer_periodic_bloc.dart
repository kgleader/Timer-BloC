import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_periodic_event.dart';
part 'timer_periodic_state.dart';

class TimerPeriodicBloc extends Bloc<TimerPeriodicEvent, TimerPeriodicState> {
  TimerPeriodicBloc() : super(TimerPeriodicInitial()) {
    on<TimerPeriodicEvent>((event, emit) {});
  }
}
