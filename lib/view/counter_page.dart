import 'package:bloc_cubit_counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Counter"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, count) => Center(
          child: Text(
            '$count',
            style: const TextStyle(fontSize: 50.0),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => context.read<CounterCubit>().increment(),
              backgroundColor: Colors.amberAccent,
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().decrement();
                context.read<CounterCubit>().checkNegativeNumb();
              },
              backgroundColor: Colors.amberAccent,
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
