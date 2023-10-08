//https://www.youtube.com/watch?v=dBwvc-U8q-c&ab_channel=RivaanRanawat
void main() {
  final list = [1, 2, 3];
  // final list =[1,2,3,4];//Bad state: Pattern matching error
  final [a, b, c] = list;
  print('$a $b $c');

  print('======= Resolve above error ===============2');
  final listR = [1, 2, 3, 4, 5];
  final [aR, bR, cR, ...] = listR;
  print('$aR $bR $cR');

  print(
      '======= Create a separate array from the other values ===============3');
  final [aR1, bR1, cR1, ...d] = listR;
  print('$aR1 $bR1 $cR1 $d '); // 4 5 [4, 5] goes to d as list

  print('======= if we do not need one value ===============4');
  final [ab1, _, cb1, ...db] = listR; // the second value is not needed
  print('$ab1 $cb1 $db ');

  print('======= get values from json ===============5');
  final json = {
    'first': 1,
    'second': 'SSS',
  };
  print(json['first']);

  final {'first': first, 'second': secondT} =
      json; // assign values to variables
// assign the value of second from json to variable secondT
  print('$first $secondT'); // get value from json

  print('======= check json values by type in the if ===============6');

  if (json case {'first': int first, 'second': String second}) {
    print('first is int $first and second is string $second');
  }

  // this is not executed, because the second value is not int
  if (json case {'first': int first, 'second': int second}) {
    print('first is int $first and second is string $second');
  }

  print('======= check the types by a switch ===============7');
  switch (json) {
    case {'first': int first, 'second': String second}:
      print('Switch first is int $first and second is string $second');
      break; // this can be omitted if there is code inside the case, otherwise
    // even is the case is correct, if there is no value in the case, it goes to the default
    default:
      print('default');
  }
}
