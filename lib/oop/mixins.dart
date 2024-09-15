// https://www.youtube.com/watch?v=OThpFGSzV1g&ab_channel=Flutterly
//https://dart.dev/language/mixins

// The purpose of the mixin is to contain methods that can be reused in other
// classes
mixin A {
  // mixin cannot have a constructor
  // A(){
  //   print('A');
  // }

  void testAbstractA(); // can have abstract method

  void testA() {
    print('testA');
  }
}

mixin class B {
  // mixin class cannot have a constructor
  // B(){
  //   print('B');
  // }

  external void testAbstractExternalB(); // can have external abstract method

  // void testAbstractB(); // cannot have abstract method

  void testB() {
    print('testB');
  }
}

// class C extends A{} // mixin cannot be extended

class C with A {
  // mixin can be used with the with keyword
  @override
  void testAbstractA() {
    print('testAbstractA in class C');
    super.testA(); // can use the super keyword
  }
}

// Another example
// only classes that extend or implement the
// Musician class can use the mixin MusicalPerformer
// . Because SingerDancer extends Musician, SingerDancer can mix in MusicalPerformer.
//https://dart.dev/language/mixins
class Musician {
  // ...
}

mixin MusicalPerformer on Musician {
  // ...
}

class SingerDancer extends Musician with MusicalPerformer {
  // ...
}

// class D2  with MusicalPerformer{}// this is not possible, because D2 does not extend Musician

// Another example 2

abstract mixin class Musician1 {
  // No 'on' clause, but an abstract method that other types must define if
  // they want to use (mix in or extend) Musician:
  void playInstrument(String instrumentName);

  void playPiano() {
    playInstrument('Piano');
  }

  void playFlute() {
    print('playFluteMethod');
    playInstrument('Flute');
  }
}

class Virtuoso with Musician1 {
  // Use Musician as a mixin
  @override
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName beautifully');
  }
}

class Novice extends Musician1 {
  // Use Musician as a class
  @override
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName poorly');
  }
}

void main() {
  // A a = A();// mixin can't be instantiated
  B b = B(); // mixin class can be instantiated
  b.testB();

  print('-------- class C -----------');
  C c = C();
  c.testA();
  c.testAbstractA();

  print('-------- Musician1  -----------');
  Musician1 musician1 = Virtuoso();
  musician1.playFlute();
  musician1.playPiano();

  Novice novice = Novice();
  novice.playFlute();
  novice.playPiano();
}
