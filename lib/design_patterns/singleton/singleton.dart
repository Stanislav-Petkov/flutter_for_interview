class Me {
  static final Me _singleton = Me._internal();
  static const String _name = 'Tyler';

  factory Me() {
    return _singleton;
  }

  static String get name => _name;

  @override
  String toString() => 'Hello, my name is $name';

  Me._internal() {
    print('internal');
  }
}

void main() {
  var tyler = Me();
  var anotherTyler = Me();
  print(tyler.hashCode);
  print(anotherTyler.hashCode);

  var samenessCheck = identical(tyler, anotherTyler)
      ? 'We are both the same ${Me.name}.'
      : 'We are different people.';
  print(samenessCheck);
}
