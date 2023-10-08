import 'package:flutter/cupertino.dart';

class AppLifeCycleManager extends StatefulWidget {
  const AppLifeCycleManager({super.key, required this.child});

  final Widget child;

  @override
  State<AppLifeCycleManager> createState() => _AppLifeCycleManagerState();
}

class _AppLifeCycleManagerState extends State<AppLifeCycleManager>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) => widget.child;
}
