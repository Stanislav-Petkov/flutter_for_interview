import 'dart:async';

Future<void> main() async {
  final future1 = fetchData1();
  final future2 = fetchData2();

  try {
    final results = await Future.wait([future1, future2]);

    // The results list contains the values of both futures in the order they were awaited.
    final result1 = results[0];
    final result2 = results[1];

    print('Result from Future 1: $result1');
    print('Result from Future 2: $result2');
  } catch (e) {
    print('An error occurred: $e');
  }
  print('---------Errors --------');
  // Example of errors
  // futuresErrors();
}

Future<String> fetchData1() async {
  await Future.delayed(const Duration(seconds: 2)); // Simulate async work
  return 'Data from Future 1';
}

Future<int> fetchData2() async {
  await Future.delayed(const Duration(seconds: 3)); // Simulate async work
  return 42;
}

// void futuresErrors() async {
//   try {
//     // Wait for each future in a list, returns a list of futures:
//     var results = await [delete(), copy(), errorResult()].wait;
//
//   } on ParallelWaitError<List<bool?>, List<AsyncError?>> catch (e) {
//
//     print(e.values[0]);    // Prints successful future
//     print(e.values[1]);    // Prints successful future
//     print(e.values[2]);    // Prints null when the result is an error
//
//     print(e.errors[0]);    // Prints null when the result is successful
//     print(e.errors[1]);    // Prints null when the result is successful
//     print(e.errors[2]);    // Prints error
//   }
// }

Future<int> delete() async {
  await Future.delayed(const Duration(seconds: 2));
  return 1;
}

Future<String> copy() async {
  await Future.delayed(const Duration(seconds: 2));
  return '2';
}

Future<bool> errorResult() async {
  await Future.delayed(const Duration(seconds: 2));
  throw 'Error';
}
