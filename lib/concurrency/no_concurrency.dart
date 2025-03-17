/*

Showcasing this package: https://pub.dev/packages/synchronized

there is no concurrent access to data in this example. The code executes
 sequentially because of the use of await in all asynchronous calls. Here's why:

writeSlow: This function is asynchronous, but it uses await to delay
 execution for 1 millisecond before printing the value. This ensures 
 that each call to writeSlow completes before the next one starts.

write: This function iterates over the list of integers and calls
 writeSlow for each value. Since await is used inside the loop, each
  call to writeSlow completes before the next iteration begins.

write1234: This function calls write with the list [1, 2, 3, 4].
 Again, because of the await in write, the execution of write1234 is sequential.

main: The main function calls write1234 twice, and both calls are
 awaited. This ensures that the first call to write1234 completes before the second one starts.

Key Point:
There is no concurrent execution in this code because all asynchronous
 operations are awaited sequentially. If you want to introduce concurrency,
  you would need to remove the await in certain places or use constructs
   like Future.wait to run multiple asynchronous operations in parallel.
*/

Future writeSlow(int value) async {
  await Future.delayed(const Duration(milliseconds: 500));
  print(value);
}

Future write(List<int> values) async {
  for (int value in values) {
    await writeSlow(value);
  }
}

Future write1234() async {
  await write([1, 2, 3, 4]);
}

Future main() async {
  await write1234();
  await write1234();
}