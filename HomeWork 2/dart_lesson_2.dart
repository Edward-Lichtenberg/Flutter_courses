import 'package:dart_lesson_2/dart_lesson_2.dart' as dart_lesson_2;

void main(List<String> arguments) {
  /*exe.1 Создать переменную типа double с именем b и со значением 4,20;
  Создать переменную типа int с именем а и со значением 3;
  Получить в консоли print равному 7,2*/

  double b = 4.20;
  int a = 3;
  print(a + b);

  /*exe.2 Создать переменную типа String с именем text, установить значение “Name”
  Далее изменить значение переменной text на “Flutter”
  Вывести в консоль print “I want to learn Flutter”*/

  String text = 'Name';
  text = 'Flutter';
  print('I want to learn $text');

  /*exe.3 Создайте переменную типа double с именем myNumber, присвойте значение 2,225.
  Создайте переменную типа String c именем myText без начального значения.
  Присвойте переменной ‘myText’ значение переменной myNumber, с приведением myNumber к типу String.
  Выведите в консоль значение переменной myText, должны получить 2,225*/

  double myNumber = 2.225;
  String myText;

  myText = myNumber.toString();

  print(myText);
}
