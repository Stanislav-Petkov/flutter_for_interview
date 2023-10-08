import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'factory_method_flutter.dart';

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
          // Case 1 find platform from context automatically
          PlatformButton(Theme.of(context).platform).build(() {
            print('Find Platform from context');
          }, const Text('From Context')),
          //Case 2 Either explicitly set the target platform
          PlatformButton(TargetPlatform.android).build(() {
            print('Android');
          }, const Text('Android')),
          PlatformButton(TargetPlatform.iOS).build(() {
            print('iOS');
          }, const Text('iOS')),
        ],
      ),
    );
  }
}
