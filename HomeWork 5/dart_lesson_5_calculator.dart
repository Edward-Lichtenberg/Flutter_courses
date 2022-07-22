import 'dart:io';
import 'dart:math';

void main() {
  print('Введите первое число: ');
  String firstStr = stdin.readLineSync()!; // ! -- гаратируем что не будет Null
  double firstNum = double.tryParse(firstStr) ??
      0; //Если firstStr будет Null то полуим 0, впротивном случаи firstStr
  if (firstNum == 0 && firstStr != '0') {
    print('Ошибка! Неверно введены данные');
    exit(200);
  }

  print(
      'Введите один из операторов:\n +\n -\n *\n /\n для возведения в степень нажмите: ^');
  String operation = stdin.readLineSync()!;

  if (operation != '+' &&
      operation != '-' &&
      operation != '*' &&
      operation != '/' &&
      operation != '^') {
    print('Ошибка! Введён неверный оператор.');
    exit(200);
  }

  if (operation == '^') {
    print('В какую степень возвести: ');
    String exponentiateStr =
        stdin.readLineSync()!; // ! -- гаратируем что не будет Null
    double exponentiateNum = double.tryParse(exponentiateStr) ??
        0; //Если exponentiateStr будет Null то полуим 0, впротивном случаи exponentiateStr
    if (exponentiateNum == 0 && exponentiateStr != '0') {
      print('Ошибка! Неверно введены данные.');
      exit(200);
    } else {
      print(
          'Ответ: ${pow(firstNum, exponentiateNum)}'); //pow(x, y) => x^y возведение в степень
      exit(200);
    }
  }
  print('Введите второе число: ');
  String secondStr = stdin.readLineSync()!;
  double secondNum = double.tryParse(secondStr) ?? 0;
  if (secondNum == 0 && secondStr != '0') {
    print('Ошибка! Неверно введены данные.');
    exit(200);
  }

  if (operation == '/' && secondNum == 0) {
    print('Ошибка! На ноль делить нельзя!');
    exit(200);
  }

  switch (operation) {
    case '+':
      print('Ответ: ${firstNum + secondNum}');
      break;
    case '-':
      print('Ответ: ${firstNum - secondNum}');
      break;
    case '*':
      print('Ответ: ${firstNum * secondNum}');
      break;
    case '/':
      print('Ответ: ${firstNum / secondNum}');
      break;
    default:
  }
}
