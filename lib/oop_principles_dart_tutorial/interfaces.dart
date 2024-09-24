//https://www.darttutorial.org/dart-tutorial/dart-interface/
import 'dart:io';

abstract class Logger {
  void log(String message);
}

class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    print('Log "$message" to the console.');
  }
}

class FileLogger implements Logger {
  @override
  void log(Pattern message) {
    print('Log "$message" to a file.');
  }
}

class App {
  Logger? logger;
  App({this.logger});

  void run() {
    logger?.log("App is starting...");
  }
}
//
// void main() {
//   // can use configuration file to select
//   // kind of loggger to use
//   var app = App(logger: FileLogger());
//   app.run();
// }


////===================================

abstract class Reader {
  String? read();
}

abstract class Writter {
  void write(String message);
}

class Console implements Reader, Writter {
  @override
  String? read() {
    print("Enter a string:");
    return stdin.readLineSync();
  }

  @override
  void write(String message) {
    print(message);
  }
}

void main() {
  var console = Console();
  String? input = console.read();
  if (input != null) {
    console.write(input);
  }
}