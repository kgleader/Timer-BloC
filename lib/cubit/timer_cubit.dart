import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wakelock/wakelock.dart';

import '../timer_states.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerInitial());

  Timer? _timer;

  onTick(Timer timer) {
    if (state is TimerProgress) {
      TimerProgress wip = state as TimerProgress;
      if (wip.elapsed! < 5) {
        emit(
          TimerProgress(wip.elapsed! + 1),
        );
      } else {
        _timer!.cancel();
        Wakelock.disable();
        emit(const TimerInitial());
      }
    }
  }
}

class StartTimer extends Cubit<StartTimer> {
  StartTimer() : super(StartTimer());
  startTimer([int? time]) {
    Wakelock.enabled;
    if (time != null) {
      emit(const TimerProgress(time));
    } else {
      emit(const TimerProgress(0));
    }
    _timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }
}
