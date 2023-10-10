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

  print('======= pattern matching ===============7');
  final human = Human( 'DD', 1);
  print(human.name); /// how we did it before dart 3
  print(human.age);

  // need to pass the name of the properties with : before the value
  final Human(:age, :name) = human; // pattern matching, no need to be in the same order
  print(name); // can use the default name of the property
  print(age);

  // if we want to use a property, but with a different name
  final Human(age:ageOtherAge, name:nameOthereName) = human;
  print(nameOthereName);
  print(ageOtherAge);

  print('======= swap variables ===============8');

  var (y,n) = ('yes','no');
  print((y,n));
  (y,n)=(n,y);
  print((y,n));

  print('======= recognise switch case conditions ===============8');
  List<String> ll = ['Hi','MAN'];
  switch(ll){
    case ['Hi', 'MAN'] :
      print('dude');
  }

  switch(ll){
    // If the first element is either Hi or HI and if the second is MAN
    case ['Hi'||'HI', 'MAN'] :
      print('dudeOR');
  }

  int index = 1;
  switch(ll){
  // extra condition, if the index is 1
    case ['Hi'||'HI', 'MAN'] when index == 1:
      print('dude When');
  }

  print('======= switch case to assign variables ===============9');
  int page = 0;

  final text = switch(page){
    0 => 'Click Here', // no need to use case instead use =>
    1 => 'Click Me',
    _ => 'Click Me Now', // instead of default use _
  };
  print(text);

  int lastPage = 1;

  // This switch can be used in Flutter also 
  final text1 = switch(lastPage){
    0 => 'Click Here', // no need to use case instead use =>
    1 when page == lastPage => 'Click Me',
    _ => 'None', // instead of default use _
  };
  print(text1);

}

class Human {
  Human(this.name, this.age);
  final String name;
  final int age;
}