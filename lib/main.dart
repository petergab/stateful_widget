import 'package:flutter/material.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 2;
  String? msg;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$number',
              style: const TextStyle(fontSize: 60),
            ),
            if (isLoading) const CircularProgressIndicator(),
            if (msg != null) Text(msg!),
            ElevatedButton(
              child: const Text('+'),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                  msg = '';
                });
                final repo = FakeRepository();
                try {
                  final result = await repo.fetchData();
                  setState(() {
                    msg = result;
                    number++;
                    isLoading = false;
                  });
                } catch (e) {
                  setState(() {
                    msg = e.toString();
                    isLoading = false;
                  });
                }
              },
            ),
            ElevatedButton(
              child: const Text('-'),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                  msg = '';
                });
                final repo = FakeRepository();
                try {
                  final result = await repo.fetchData();
                  setState(() {
                    msg = result;
                    number--;
                    isLoading = false;
                  });
                } on Exception catch (e) {
                  setState(() {
                    msg = e.toString();
                    isLoading = false;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FakeRepository {
  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 1));
    throw Exception('Something went wrong!');
    // return 'Done';
  }
}
