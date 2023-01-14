import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/cubit/timer_cubit.dart';
import 'package:timer/timer_states.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('The BloC Timer'),
        ),
        body: BlocBuilder<TimerCubit, TimerState>(
          builder: (context, state) {
            if (state is TimerInitial) {
              return Center(
                child: ElevatedButton(
                  onPressed: () =>
                      BlocProvider.of<TimerCubit>(context).startTimer(0),
                  child: const Text('Start'),
                ),
              );
            }
            if (state is TimerProgress) {
              return Center(
                child: Text("${state.elapsed!}"),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
