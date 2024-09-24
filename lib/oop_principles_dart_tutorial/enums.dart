//https://www.darttutorial.org/dart-tutorial/dart-enum/
enum Status {
  pending,
  completed,
  rejected,
}

void main() {
  var status = Status.completed;

  switch (status) {
    case Status.completed:
      print('The request completed successfully.');
      break;
    case Status.rejected:
      print('The request faield.');
      break;
    case Status.pending:
      print('The request is pending.');
      break;
  }
  print('indexes');
  print(Status.pending.index);
  print(Status.completed.index);
  print(Status.rejected.index);

  print('================');
  print('values: ${Status.values}');

  var firstValue = Status.values[1];
  print('first value: $firstValue');

  print('========Iterate ========');
  List<Status> statuses = Status.values;
  for (var status in statuses) {
    print(status);
  }

  print('========Check if an enum is an instance of Enum ========');
  print(status is Enum); // true

  // The operator '<' isn't defined for the type 'Status'. (Documentation)
  // var isLess = status < Status.pending; // This is no possible


}