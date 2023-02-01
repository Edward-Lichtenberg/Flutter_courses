import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Counter',
        ),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).plus();
                  },
                  child: const Text('+2'),
                ),
                Text(
                  ' = ${state.number} = ',
                  style:
                      const TextStyle(fontSize: 50, color: Colors.indigoAccent),
                ),
                FloatingActionButton(
                  onPressed: () {
                    if (state.number <= 0) {
                      Text('${state.number}');
                    } else {
                      BlocProvider.of<CounterCubit>(context).minus();
                    }
                  },
                  child: const Text('-1'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
