//https://applover.com/blog/dart-asynchronous-programming-vs-parallelism/#:~:text=This%20approach%20is%20called%20parallelism,load%20off%20the%20main%20isolate.
//Dart as a single-threaded programming language
import 'dart:io';

void longRunningOperation() {
  for (int i = 0; i < 10; i++) {
    sleep(Duration(seconds: 1));
    print('index equals: $i');
  }
}

void main() {
  longRunningOperation();
  for (int i = 10; i < 20; i++) {
    sleep(Duration(seconds: 1));
    print('index from main function: $i');
  }
  print('end of main function');
}

//index equals: 0
// index equals: 1
// index equals: 2
// index equals: 3
// index equals: 4
// index equals: 5
// index equals: 6
// index equals: 7
// index equals: 8
// index equals: 9
// index from main function: 10
// index from main function: 11
// index from main function: 12
// index from main function: 13
// index from main function: 14
// index from main function: 15
// index from main function: 16
// index from main function: 17
// index from main function: 18
// index from main function: 19
// end of main function