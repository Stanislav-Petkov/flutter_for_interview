void main() {
  var lst  = List.generate(5, ( i)=>'$i'); // Creates fixed-length list.
  lst[0] = '12';
  // lst[1] = 1;
  // lst[2] = 11;
  print(lst);
}