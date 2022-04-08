import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stateful_widget/repositories/fake_repository.dart';

import 'cubit/home_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeCubitPage(),
    );
  }
}

class HomeCubitPage extends StatelessWidget {
  const HomeCubitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(FakeRepository()),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.number}',
                    style: const TextStyle(fontSize: 60),
                  ),
                  if (state.isLoading) const CircularProgressIndicator(),
                  if (state.msg != null) Text(state.msg!),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        child: const Text('-'),
                        onPressed: () async {
                          context.read<HomeCubit>().decrement();
                        },
                      ),
                      ElevatedButton(
                        child: const Text('+'),
                        onPressed: () async {
                          context.read<HomeCubit>().increment();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
