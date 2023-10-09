import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//https://www.youtube.com/watch?v=eEg1CBKuqFg&list=PLlzmAWV2yTgB-1LdoO-9vCTgrE-1dyWKP&index=3&ab_channel=RivaanRanawat

abstract class PlatformIndicator {
  Color color();
  Widget build();

  /// factory method
  factory PlatformIndicator(TargetPlatform platform){
    switch(platform){
      case TargetPlatform.android:
        return AndroidIndicator();
      case TargetPlatform.iOS:
        return IOSIndicator();
      default:
        return IOSIndicator();
    }
  }

}
 class AndroidIndicator implements PlatformIndicator{
  @override
  Widget build() {
    return CircularProgressIndicator(color: color(),);
  }
 @override
  Color color() {
    return Colors.blue;
  }
}

class IOSIndicator implements PlatformIndicator{
  @override
  Widget build() {
    return const CupertinoActivityIndicator();
  }
  @override
  Color color() {
    return Colors.red;
  }
}