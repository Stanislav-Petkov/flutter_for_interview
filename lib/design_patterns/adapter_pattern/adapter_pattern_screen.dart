import 'package:flutter/material.dart';
import 'package:flutter_for_interview/design_patterns/adapter_pattern/adapter_pattern.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Adapter Pattern 1',
      home: MyHomePage(title: 'Adapter Pattern'),
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
  final PostAPI postAPI = PostAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: postAPI.getPosts().length,
              itemBuilder: (context, index) {
                final posts = postAPI.getPosts()[index];
                return ListTile(
                  title: Text(posts.title),
                  subtitle: Text(posts.bio),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
