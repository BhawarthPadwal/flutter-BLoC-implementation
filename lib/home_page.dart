import 'package:flutter/material.dart';
import 'package:flutter_bloc_practical/features/counter/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc counterBloc = CounterBloc();
  int val = 0;

  /// Without initializing state with calling event it will show 'Not Found'
  @override
  void initState() {
    counterBloc.add(CounterIncrementEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocConsumer<CounterBloc, CounterState>(
        bloc: counterBloc,
        listenWhen: (previous, current) => current is CounterActionState,
        buildWhen: (previous, current) => current is !CounterActionState,
        listener: (context, state) {
          if (state is CounterShowSnackbarActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Snackbar'),
            ));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CounterIncrementState:
              final successState = state as CounterIncrementState;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'You have pushed the button this many times',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      successState.val.toString(),
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          counterBloc.add(CounterShowSnackbarEvent());
                        },
                        child: const Text('Snackbar')),
                  ],
                ),
              );
            default:
              return const Center(
                child: Text('Not found'),
              );
          }
        },
      ),

      /// Bloc Listener Code
      /*BlocListener<CounterBloc, CounterState>(
        bloc: counterBloc,
        listener: (context, state) {
          if (state is CounterShowSnackbarActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Snackbar'),
            ));
          } else if (state is CounterIncrementActionState) {
            setState(() {
              val = val + 1;
            });
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'You have pushed the button this many times',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                val.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    counterBloc.add(CounterIncrementEvent());
                  },
                  child: const Text('Add')),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    counterBloc.add(CounterShowSnackbarEvent());
                  },
                  child: const Text('Snackbar')),
            ],
          ),
        ),
      ),*/

      /// Bloc Builder Code
      /* BlocBuilder<CounterBloc, CounterState>(
        bloc: counterBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CounterIncrementState:
              final successState = state as CounterIncrementState;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'You have pushed the button this many times',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      successState.val.toString(),
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              );
              default:
                return const Center(
                  child: Text('Not found'),
                );
          }
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'You have pushed the button this many times',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  successState.val.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          );
        },
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.add(CounterIncrementEvent());
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
