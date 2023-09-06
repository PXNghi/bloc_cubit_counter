import 'package:bloc_cubit_counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Counter"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, counter) => Center(
          child: Text(
            "$counter",
            style: const TextStyle(fontSize: 50.0),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 35.0),
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
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().decrement();
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
