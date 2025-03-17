//https://applover.com/blog/dart-asynchronous-programming-vs-parallelism/#:~:text=This%20approach%20is%20called%20parallelism,load%20off%20the%20main%20isolate.
import 'dart:async';

// Calling an asynchronous method

// it's important to note that these operations
// are not running simultaneously. Dart is
// single-threaded, which means it can only
// do one thing at a time. The await keyword
// simply tells Dart to pause execution of
// the current function and allow other code
// to run
// until the awaited operation is complete.
Future<void> longRunningOperation() async {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('index equals: $i');
  }
}

Future main() async {
  longRunningOperation();
  for (int i = 10; i < 20; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('index from main function: $i');
  }
  print('end of main function');
}

// Because of the awai in front of the longRunningOperation() function,
// the main function will wait for the longRunningOperation() to finish before
// executing the for loop and will behave like synchronous code. from
// synchronous_code.dart

//Future<void> longRunningOperation() async {
//   for (int i = 0; i < 10; i++) {
//     await Future.delayed(Duration(seconds: 1));
//     print('index equals: $i');
//   }
// }
//
// Future main() async {
//   await longRunningOperation();
//   for (int i = 10; i < 20; i++) {
//     await Future.delayed(Duration(seconds: 1));
//     print('index from main function: $i');
//   }
//   print('end of main function');
// }