class Data<T> {
  T data;
  Data(this.data);
}

class IntData {
  int data;
  IntData(this.data);
}

class DoubleData {
  double data;
  DoubleData(this.data);
}

// Define generic method
T genericMethod<T>(T value) {
  return value;
}

T genericMethod1<T, U>(T value1, U value2) {
  return value1;
}

class DataR<T extends num> {
  T data;
  DataR(this.data);
}

double getAverage<T extends num>(T value1, T value2) {
  return (value1 + value2) / 2;
}

void main() {
  print("Average of int: ${getAverage<int>(10, 20)}");
  print("Average of double: ${getAverage<double>(10.5, 20.5)}");

  Data<double> doubleData = Data<double>(10.5);
  print("DoubleData: ${doubleData.data}");

  print(genericMethod1<int, String>(1011, "Hello"));
  print(genericMethod1<String, int>("Hello", 1011));

  // call the generic method
  print("Int: ${genericMethod<int>(10)}");
  print("Double: ${genericMethod<double>(10.5)}");
  print("String: ${genericMethod<String>("Hello")}");

  List l = ['1', 1, 1.1];
  for (var i in l) {
    print(i);
  }
  final i = IntData(1);
  print('${i.data}');
  final d = DoubleData(2.2);
  print('${d.data}');
  final d1 = Data<int>(1);
  print('${d1.data}');
  final d2 = Data<double>(2.2);
  print('${d2.data}');
  Map m = {'r': 1, 1: 'f'};
  var t = m.containsKey('r');
  var t1 = m.containsKey(1);
  print('t $t, t1 $t1');
}
