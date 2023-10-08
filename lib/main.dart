import 'package:flutter/material.dart';
import 'package:flutter_for_interview/item_count.dart';
import 'package:flutter_for_interview/positioned_tiles_keys.dart';
import 'package:flutter/services.dart';
import 'bike.dart';
import 'employee.dart';
import 'inheritet_nose.dart';
import 'car.dart';

void main() {

  runApp(const MyApp());
}

void encapsulations(){
  final employee = Employee();
  employee.setName('GG');
  print('Employee name1 is ${employee.getName()}');
  final stud = Student1();
  final stud1 = stud.getSchoolName();
  print(stud1);

  final vehicle = VehicleEncap();
  vehicle.model = 'model1';
  final model = vehicle.model;
}
void constConstructors() {
  const a = Bike('name1', 'school', example: 'example1');
  var b = Bike('name1', 'school', example: 'example1');
  print('a: ${a.hashCode} b: ${b
      .hashCode}'); // if Bike is const then same else different
  print('a == b: ${a == b}'); // if Bike is const then true else false

}

void carExample() {
  Car.nameStatic;
  Car.displayStatic();
  Car car = Car('outside', example: 'example2');
  car.name1 = 'outside1';
  print('sh:${car.school}');
  print('111 ${car.name1}');
  car.displayNonStatic();
  print('counter:${Car.counter}');
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = 'First';

  void updateTitle() {
    setState(() {
      title = 'Second';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(
        title: title,
        onPressed: updateTitle,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, required this.onPressed, super.key});

  final String title;
  final VoidCallback onPressed;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late NetworkImage image;

  late MethodChannel platform;

  @override
  void initState() {
    super.initState();

    platform = MethodChannel('com.example/battery');
    print('initState');
    _animationController = AnimationController(vsync: this);
    image = const NetworkImage('https://picsum.photos/250?image=9');

    // WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.title != oldWidget.title) {
      print('Title changed');
    }
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose');
    _animationController.dispose();
    super.dispose();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);
  //   if (state == AppLifecycleState.detached) {}
  //   print('AppLifecycleState: $state');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: platform.invokeMethod('getBatteryLevel'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // While the Future is still running, show a loading indicator.
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // If there's an error, display an error message.
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  // If the Future is complete and data is available, display the battery level.
                  int batteryLevel = snapshot.data
                  as int; // Assuming the battery level is an integer.
                  return Text('Battery level: $batteryLevel');
                } else {
                  // Handle other ConnectionState states if needed.
                  return Text('ConnectionState: ${snapshot.connectionState}');
                }
              },
            ),
            ElevatedButton(
              onPressed: widget.onPressed,
              child: Text('DidUpdateWidget'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnotherPage(),
                    ),
                  );
                },
                child: Text('Go To Another')),
            // Image.network('https://picsum.photos/250?image=9'),
            // Image(image: image),
          ],
        ),
      ),
    );
  }

// @override
// void dispose() {
//   WidgetsBinding.instance.removeObserver(this);
//   super.dispose();
// }
}

class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Next Page'),
        ),
        body: const Center(
          child: Text('AnotherPage'),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
