class Vector2d {
  // ...
  int x;
  int y;

  Vector2d.named({required this.x, required this.y});

  void test() {
    print("test");
  }
}

class Vector3d extends Vector2d {
  // ...

  int z;

  // Forward the y parameter to the named super constructor like:
  // Vector3d.yzPlane({required double y, required this.z})
  //       : super.named(x: 0, y: y);
  Vector3d.yzPlane({required super.y, required this.z}) : super.named(x: 0);

  void a() {
    test();
  }
}

void main() {
  Vector3d vector3d = Vector3d.yzPlane(y: 1, z: 2);
  vector3d.test();
  vector3d.a();
}
