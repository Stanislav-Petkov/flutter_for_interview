void main() {
  print(swap((3, 4)));

  (String, int) record;
  record = ('A string', 123);

  ({int a, int b}) recordAB = (a: 1, b: 2);
  ({int x, int y}) recordXY = (x: 3, y: 3);

  // recordAB = recordXY; // error
  (int a, int b) record1 = (1, 2);
  (int x, int y) record2 = (3, 4);
  record1 = record2;
  // recordAB = recordXY;

  (num, Object) pair = (42, 'a');

  var first = pair.$1;
  var second = pair.$2;

  // record equality
  (int x, int y, int z) point = (1, 2, 3);
  (int r, int g, int b) color = (1, 2, 3);
  print(point == color);

  ({int x, int y, int z}) point1 = (x: 1, y: 2, z: 3);
  ({int r, int g, int b}) color1 = (r: 1, g: 2, b: 3);

  print(point1 == color1);
}

(int, int) swap((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

(int, int) swap1((int, int) record) {
  return (record.$2, record.$1);
}

recordFields() {
  var record = ('first', a: 2, b: true, 'last');

  print(record.a);
  print(record.b);
  print(record.$1);
  print(record.$2);
  print(record);
}
