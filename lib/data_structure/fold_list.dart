void main(){
  // Put first letter of each name together
  // and print it as a string;
  List<String> names = ['Max','John','Sara','Peter'];
  // With forEach method
  List<String> letters = [];
  names.forEach((name)  => letters.add(name.split('').first));
  print(letters.join());

  
  print(names[0].split(''));
}