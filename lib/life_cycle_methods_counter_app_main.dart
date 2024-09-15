import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = 'Flutter Home Page';

  void updateTitle() {
    setState(() {
      title = 'New Flutter Home Page';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: title,
        onPressed: updateTitle,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // ModalRoute.of(context);
    print('initState');

    _animationController = AnimationController(vsync: this);
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    ModalRoute.of(context)?.settings.arguments;
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('oldWidget: ${oldWidget.hashCode} newWidget: ${widget.hashCode}');
    print('didUpdateWidget');
    if (widget.title != oldWidget.title) {
      print('title was changed');
    }
  }

  @override
  deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
                onPressed: widget.onPressed,
                child: const Text('DidUpdate Widget')),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ExamplePage()));
                },
                child: const Text('dispose'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExamplePage'),
      ),
      body: const Center(
        child: Text('ExamplePage'),
      ),
    );
  }
}
