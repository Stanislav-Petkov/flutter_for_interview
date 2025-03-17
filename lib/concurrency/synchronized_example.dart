import 'dart:async';
import 'dart:io';
import 'package:synchronized/synchronized.dart';


/*
The `Lock` class and its `synchronized` method, provided by the `synchronized` package in Dart,
are used to ensure mutual exclusion when accessing shared resources or executing critical
sections of code. Here's a detailed explanation:

What is a Lock?
  A `Lock` is a synchronization primitive that ensures only one task (or thread) can execute a
  critical section of code at a time. It is useful in scenarios where concurrent access to 
  shared resources could lead to race conditions or inconsistent states.

How does synchronized work?
  The `synchronized` method of a Lock ensures that only one asynchronous operation can execute 
  the block of code wrapped in synchronized at a time. If another operation tries to acquire
  the lock while it is already held, it will wait until the lock is released.

Key Features of `Lock` and `synchronized`:
  1. Mutual Exclusion:

  -Only one task can execute the critical section at a time.
  -Other tasks attempting to acquire the lock will wait until it is released.

  2. Asynchronous Support:

  -The synchronized method works seamlessly with asynchronous code, ensuring that
  the lock is released even if the critical section contains await calls.

  3. Non-blocking:

  -Tasks waiting for the lock do not block the event loop; they are resumed when the lock becomes available.

 */

Future<void> writeSlow(int value) async {
  await Future<void>.delayed(const Duration(milliseconds: 1));
  stdout.write(value);
}

Future<void> write(List<int> values) async {
  for (var value in values) {
    await writeSlow(value);
  }
}

Future<void> write1234() async {
  await write([1, 2, 3, 4]);
}

class Demo {
  /*
  The write1234 function is called twice without synchronization.
 Since these calls are not awaited, they execute concurrently,
 leading to interleaved output (11223344).
 */
  Future<void> test1() async {
    stdout.writeln('not synchronized');
    //await Future.wait([write1234(), write1234()]);
    // ignore: unawaited_futures
    write1234();// Not awaited
    // ignore: unawaited_futures
    write1234();

    await Future<void>.delayed(const Duration(milliseconds: 50));
    stdout.writeln();
  }

/*
test2 (synchronized):

A Lock is used to synchronize the calls to write1234.
The synchronized method ensures that only one call to write1234 runs at a time.
As a result, the output is sequential (12341234).
*/
  Future<void> test2() async {
    stdout.writeln('synchronized');

    var lock = Lock();
    // ignore: unawaited_futures
    lock.synchronized(write1234);
    // ignore: unawaited_futures
    lock.synchronized(write1234);

    await Future<void>.delayed(const Duration(milliseconds: 50));

    stdout.writeln();
  }

  Future<void> readme1() async {
    var lock = Lock();

    // ...
    await lock.synchronized(() async {
      // do some stuff
    });
  }

  Future<void> readme2() async {
    var lock = Lock();
    if (!lock.locked) {
      await lock.synchronized(() async {
        // do some stuff
      });
    }
  }

  Future<void> readme3() async {
    var lock = Lock();
    var value = await lock.synchronized(() {
      return 1;
    });
    stdout.writeln('got value: $value');
  }
}

Future<void> main() async {
  var demo = Demo();

  await demo.test1();
  stdout.writeln('TEST_2:');
  await demo.test2();
  stdout.writeln('README_1:');
  await demo.readme1();
  await demo.readme1();
  stdout.writeln('README_3:');
  await demo.readme3();
}
