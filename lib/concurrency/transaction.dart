/*
A transaction is an atomic operation that ensures a series of operations
 execute completely or not at all. This prevents data inconsistency when
  working with databases like Firebase Firestore, SQLite, or PostgreSQL
   in Flutter applications.

Why Use Transactions?
Imagine a banking app where a user transfers money:

Deduct $100 from Account A
Add $100 to Account B
If the app crashes after step 1, the money disappears! 😱
A transaction ensures both steps succeed or none execute to prevent data corruption.

Transactions in Firebase Firestore
Firestore supports ACID (Atomic, Consistent, Isolated, Durable) transactions,
 meaning multiple operations succeed together or fail together.

Example: Atomic Balance Update
✅ Ensures both balances update together.
❌ If one update fails, everything rolls back (money isn’t lost).
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sqflite/sqflite.dart';

Future<void> transferFunds(String senderId, String receiverId, double amount) async {
  final db = FirebaseFirestore.instance;

  return db.runTransaction((transaction) async {
    final senderRef = db.collection('users').doc(senderId);
    final receiverRef = db.collection('users').doc(receiverId);

    final senderSnapshot = await transaction.get(senderRef);
    final receiverSnapshot = await transaction.get(receiverRef);

    double senderBalance = senderSnapshot['balance'];
    double receiverBalance = receiverSnapshot['balance'];

    if (senderBalance < amount) {
      throw Exception("Insufficient funds");
    }

    transaction.update(senderRef, {'balance': senderBalance - amount});
    transaction.update(receiverRef, {'balance': receiverBalance + amount});
  }).then((_) {
    print("Transaction successful!");
  }).catchError((error) {
    print("Transaction failed: $error");
  });
}

/*

Transactions in SQLite (Using sqflite)
SQLite in Flutter also supports transactions using batch().

Example: Insert & Update in One Transaction

✅ Ensures atomic updates—either both succeed or none.
❌ If the app crashes mid-transaction, SQLite rolls back automatically.

Key Takeaways
A transaction ensures multiple operations execute completely or not at all.
Firestore uses runTransaction() for atomic updates.
SQLite uses transaction() for bulk updates.
Transactions prevent data corruption in financial apps, bookings, and multi-step workflows.
*/

Future<void> transferFundsDB(Database db, int senderId, int receiverId, double amount) async {
  await db.transaction((txn) async {
    var sender = await txn.query('users', where: 'id = ?', whereArgs: [senderId]);
    var receiver = await txn.query('users', where: 'id = ?', whereArgs: [receiverId]);

    double senderBalance = sender.first['balance'] as double;
    double receiverBalance = receiver.first['balance'] as double;

    if (senderBalance < amount) throw Exception("Insufficient funds");

    await txn.update('users', {'balance': senderBalance - amount}, where: 'id = ?', whereArgs: [senderId]);
    await txn.update('users', {'balance': receiverBalance + amount}, where: 'id = ?', whereArgs: [receiverId]);
  });
}

