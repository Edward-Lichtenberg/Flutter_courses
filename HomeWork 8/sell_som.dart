import 'dart:io';
import 'dart_lesson_8_converter.dart';

void sellSom(double usd1, double eur1, double rub1, double kzt1) {
  print('Выберите валюту покупки:');
  abbreviation();
  String inputCurrency = stdin.readLineSync()!.toUpperCase();
  print('Сколько СОМ вы хотите продать?');
  double inputSum = double.parse(stdin.readLineSync()!);
  switch (inputCurrency) {
    case 'USD':
      print('На $inputSum сом Вы купили ${inputSum / usd1} $inputCurrency');
      break;
    case 'EUR':
      print('На $inputSum сом Вы купили ${inputSum / eur1} $inputCurrency');
      break;
    case 'RUB':
      print('На $inputSum сом Вы купили ${inputSum / rub1} $inputCurrency');
      break;
    case 'KZT':
      print('На $inputSum сом Вы купили ${inputSum / kzt1} $inputCurrency');
      break;
    default:
      print('Ошибка! Указано неверное значение.');
      break;
  }
}
