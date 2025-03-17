//https://dart.dev/language/branches#exhaustiveness-checking

void main(){
  bool? nullableBool = null;
  // Non-exhaustive switch on bool?, missing case to match null possibility:
  switch (nullableBool) {
    case true:
      print('yes');
    case false:
      print('no');
    case null:
      // TODO: Handle this case.
  }

  // this is not possieble in nullable bool
  // switch (nullableBool) {
  //   case true:
  //     print('yes');
  //   case false:
  //     print('no');
  // }
}