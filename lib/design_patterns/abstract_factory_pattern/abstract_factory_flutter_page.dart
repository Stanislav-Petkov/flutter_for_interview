import 'package:flutter/material.dart';
import 'package:flutter_for_interview/design_patterns/abstract_factory_pattern/abstract_factory.dart';

import 'abstract_factory_static.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Factory Method Pattern ',
      home: MyHomePage(title: 'Factory Method  Pattern'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AbstractFactoryImpl().buildButton(context, 'Hello', () {}),
          const SizedBox(height: 10),
          AbstractFactoryImpl().buildIndicator(context),

          // Case 2 with static method
          AbstractFactoryImplWithStatic.buildButton(context, 'Hello 1', () {}),
          const SizedBox(height: 10),
          AbstractFactoryImplWithStatic.buildIndicator(context),
        ],
      ),
    );
  }
}
