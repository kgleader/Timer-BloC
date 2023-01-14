part of 'timer_cubit.dart';

abstract class TimerState extends Equatable {
  final int elapsedTime;
  final String timerName;
  final int timerDuration;

  const TimerState(this.elapsedTime, this.timerName, this.timerDuration);

  @override
  List<Object> get props => [];
}

class TimerInitial extends TimerState {
  const TimerInitial() : super(0);

  @override
  List<Object?> get props => [];
}

class TimerProgress extends TimerState {
  const TimerProgress(int? elapsed) : super(elapsed);

  @override
  List<Object?> get props => [elapsed];
}
