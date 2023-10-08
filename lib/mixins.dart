mixin A {
  void a() {
    print("A");
  }
}

class B with A {
  void b() {
    print("B");
  }
}

class Performer {
  void perform() => print("Perform");
}

mixin Guitarist {
  void playGuitar() => print("Playing the guitar");

  void perform() => playGuitar();
}
mixin Drummer {
  void playDrums() => print("Playing the drums");

  void perform() => playDrums();
}

// class Musician extends Performer with  Guitarist,Drummer {}
class Musician  with  Guitarist,Drummer {}
// class Musicia1n  extends  Guitarist {}

void main() {
  Musician musician = Musician();
  musician.perform();
}
