//https://www.youtube.com/watch?v=dBwvc-U8q-c&ab_channel=RivaanRanawat
void main() {
  var r = getValue();
  print(r[0]);
  print(r[1]);

  var rs = getValues();
  print(rs.$1);
  print(rs.$2);
  print('======================1');
  var (point, greeting) = getValues();
  print(point);
  print(greeting);

  print('=======Named===============2');
  var named = getValuesNamed();
  print(named.point);
  print(named.greeting);

  print('=======Immutable===============2');
  // Records are immutable
  const myRecord = (1.0,'JJ',true);
  // myRecord.$1 = 4.0; //The setter '$1' isn't defined for the type '(double, String, bool)')

  print('=======accessing===============3');
  var myRecordWithNamed = (h:1.0,'Jo',isAdult:true);
  print(myRecordWithNamed.$1); // gets the first element, which is not named
  print(myRecordWithNamed.h); // access by name

  print('=======assign new value===============4');
  myRecordWithNamed = (h:2.0,'Jo',isAdult:true);
  myRecordWithNamed = (h:4.0,isAdult:true,'Jo',); // can assign in any order
  // the requirement is that all field types are assigned
  print(myRecordWithNamed.h);
  print(myRecordWithNamed.isAdult);

  print('=======assign null value===============5');

  (double, String)? rec = (1.0,'JJ');
  print(rec);
  rec = null;
  print(rec);

  print('======= equality of records ===============6');

  ({int a, int b}) first = (a:1,b:2);
  ({int x, int b}) second = (x:1,b:2);
  // first = second;// not possibleA value of type '({int b, int x})' can't be
  // assigned to a variable of type '({int a, int b})'. (Documentation)
  ({int a, int b}) first2 = (a:1,b:2);
  ({int a, int b}) second2 = (a:4,b:5);
  first2 = second2;// the name of the variables should be the same
  print(first2);
}

({double point, String greeting}) getValuesNamed() {
  return (point: 1, greeting: 'hello');
}

(double, String) getValues() {
  return (1, 'hello');
}

List<dynamic> getValue() {
  return [1, 'h'];
}
