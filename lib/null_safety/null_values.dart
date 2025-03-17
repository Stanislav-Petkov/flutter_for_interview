//https://dart.dev/null-safety/understanding-null-safety#uninitialized-variables

// Uninitialized variables
class SomeClass {
  static int staticField = 0; // needs to be assigned with default value
}

void main(){
  SomeClass.staticField = 10;// can be assigned

  int a; // uninitialized variable
}

