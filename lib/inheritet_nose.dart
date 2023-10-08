import 'package:flutter/material.dart';

class InheritedNose extends InheritedWidget {
  const InheritedNose(this.name, Widget child, {super.key})
      : super(child: child);

  final String name;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static InheritedNose of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedNose>()!;
}

class FilipWidget extends StatelessWidget {
  const FilipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final nose =
        context.dependOnInheritedWidgetOfExactType<InheritedNose>()?.name;
    final nose1 = InheritedNose.of(context).name;
    return Center(
      child: Text(nose1!),
    );
  }
}
