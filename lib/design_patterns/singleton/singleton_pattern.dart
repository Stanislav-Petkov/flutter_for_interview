class Singleton1 {
  static Singleton1? _instance;

  Singleton1._internal() {
    print('Singleton1 created');
  }

  static Singleton1 getInstance() {
    _instance ??= Singleton1._internal();
    return _instance!;
  }
}

class Singleton2 {
  static Singleton2? _instance;

  Singleton2._internal() {
    print('Singleton2 created');
  }

  static get instance {
    _instance ??= Singleton2._internal();
    return _instance!;
  }
}

class Singleton3 {
  static Singleton3? _instance;

  Singleton3._internal() {
    print('Singleton3 created');
  }

  factory Singleton3() {
    _instance ??= Singleton3._internal();
    return _instance!;
  }
}

void main() {
  // The print is called once even though we call the getInstance method twice
  Singleton1.getInstance();
  Singleton1.getInstance();

  /// We can force lazy initialization by using late keyword
  /// in this way the object is not initialized until it is used
  late Singleton1 t = Singleton1.getInstance();
  // it can used like this:
  // t;

  // The print is called once
  // Singleton2.instance;
  // Singleton2.instance;
  late Singleton2 s = Singleton2.instance;

  // The print is called once
  // Singleton3();
  // Singleton3();

  late Singleton3 d = Singleton3();
}
