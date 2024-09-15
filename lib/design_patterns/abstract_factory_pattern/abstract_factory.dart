import 'package:flutter/material.dart';
import 'package:flutter_for_interview/design_patterns/abstract_factory_pattern/platform_button.dart';
import 'package:flutter_for_interview/design_patterns/abstract_factory_pattern/platform_indicator.dart';

/// Case 1: Abstract Factory Pattern
abstract class AbstractFactory {
  Widget buildButton(
    BuildContext context,
    String text,
    VoidCallback onPressed,
  );
  Widget buildIndicator(BuildContext context);
}

class AbstractFactoryImpl implements AbstractFactory {
  @override
  Widget buildButton(
    BuildContext context,
    String text,
    VoidCallback onPressed,
  ) {
    return PlatformButton(Theme.of(context).platform).build(
      onPressed,
      Text(text),
    );
  }

  @override
  Widget buildIndicator(BuildContext context) {
    return PlatformIndicator(Theme.of(context).platform).build();
  }
}
