//https://www.youtube.com/watch?v=dBwvc-U8q-c&ab_channel=RivaanRanawat

void main() {
  Animal1 animal1Abstract = Cat1();
  // when Animal1 is abstract: abstract class Animal1 {} we are not forced to
  // check all the subtypes
  // in the animal class, which we want, so we use sealed class
  switch (animal1Abstract) {
    case Dog():
      print('dog');
  }

  Animal animal = Cat();

  switch (animal) {
    case Dog():
      print('dog');
    case Human():
      print('human');
    case Cat():
      print('cat');
  }

  // var t = Animal(); // abstract class cannot be instantiated
  // var t1 = Animal1();// sealed class is implicitly abstract

  var c = CatFinal(); // final class can be instantiated

  switch(c){}


  CatFinal1 catFinal1 = CatFinal1();

  // interface class can be instantiated
  CatInterface catInterface = CatInterface();
  // Animal1 animal1 = Animal1();//Abstract classes can't be instantiated. (Documentation)

  // CatAbstractInterface catAbstractInterface = CatAbstractInterface(); //Abstract classes can't be instantiated. (Documentation)

}

abstract class Animal1 {}

class Human1 implements Animal1 {}

class Dog1 implements Animal1 {}

class Cat1 extends Animal1 {}

// All the subtypes of the sealed class must be in the same file(library)
// this is for the direct subtypes
sealed class Animal {}

class Human implements Animal {}

class Dog implements Animal {}

class Cat extends Animal {}
// there is no error in the switch case, because it is not a direct subtype
// of Animal
class Cat2 implements Cat{}

// final class cannot be extended or implemented outside of the library as the
//sealed class
final class CatFinal{}


//class extending a final class , must be base, final or sealed
final class CatBaseF extends CatFinal{}
// base class cannot be implemented, but it can be extended
base class CatBase{
  CatBase(){
    // when a class extending this base is created, this class constructor is called
    print('CatBase');
  }
}

// class extending a base class , must be base, final or sealed
base class CatBase1 extends CatBase{}

// the CatBase base class constructor is called also
final class CatFinal1 extends CatBase{

}

interface class CatInterface{
  CatInterface(){
    print('CatInterface');
  }
}

class CatInterface1 implements CatInterface{}

// this cannot be done outside of the library, because it is an interface class and
// there is an error:
//The class 'CatInterface' can't be extended outside of its library
// because it's an interface class. (Documentation)
class CatInterface2 extends CatInterface{}

abstract interface class CatAbstractInterface{
  CatAbstractInterface(){
    print('CatAbstractInterface');
  }
}

// can be used as a  class and as a mixin, cannot have a constructor
mixin class CatMixin{
  // CatMixin(){
  //   print('CatMixin');
  // }
}

class Animal5{}
// before we could do this, but now we cannot
// class Human5 with Animal5{}

// to use a class with the 'with' keyword, the class must be a mixin
class Human6 with CatMixin{}