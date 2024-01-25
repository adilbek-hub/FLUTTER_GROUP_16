import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is InitialState) {
            return _counter(context, 0);
          }
          if (state is UpdateState) {
            return _counter(context, state.counter);
          }
          return Container();
        },
      ),
    );
  }
}

Widget _counter(BuildContext context, int counter) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          counter.toString(),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 50.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.red,
              height: 50,
              onPressed: () {
                context.read<CounterBloc>().add(NumberDecreaseEvent());
                print(counter);
              },
              child: const Text(
                '-',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            const SizedBox(width: 20),
            MaterialButton(
              color: Colors.green,
              height: 50,
              onPressed: () {
                context.read<CounterBloc>().add(NumberIncreaseEvent());
                print(counter);
              },
              child: const Text(
                '+',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
