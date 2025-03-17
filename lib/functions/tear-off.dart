//https://dart.dev/language/functions#anonymous-functions
var charCodes = [68, 97, 114, 116];
var buffer = StringBuffer();

void main(){
// Function tear-off
  charCodes.forEach(print);

// Method tear-off
//   charCodes.forEach(buffer.write);

}