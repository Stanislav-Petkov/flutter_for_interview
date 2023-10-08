import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_for_interview/design_patterns/abstract_factory_pattern/platform_button.dart';
import 'package:flutter_for_interview/design_patterns/abstract_factory_pattern/platform_indicator.dart';

/// Case 2: Abstract Factory Pattern with static method
class AbstractFactoryImplWithStatic {
  static Widget buildButton(
    BuildContext context,
    String text,
    VoidCallback onPressed,
  ) {
    return PlatformButton(Theme.of(context).platform)
        .build(onPressed, Text(text));
  }

  static Widget buildIndicator(BuildContext context) {
    return PlatformIndicator(Theme.of(context).platform).build();
  }
}
