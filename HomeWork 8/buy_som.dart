import 'dart:io';
import 'dart_lesson_8_converter.dart';

void buySom(double usd2, double eur2, double rub2, double kzt2) {
  print('Выберите валюту продажи:');
  abbreviation();
  String inputCurrency = stdin.readLineSync()!.toUpperCase();
  print('Сколько $inputCurrency вы хотите продать?');
  double inputSum = double.parse(stdin.readLineSync()!);
  switch (inputCurrency) {
    case 'USD':
      print('На $inputSum $inputCurrency Вы купили ${inputSum * usd2} сом');
      break;
    case 'EUR':
      print('На $inputSum $inputCurrency Вы купили ${inputSum * eur2} сом');
      break;
    case 'RUB':
      print('На $inputSum $inputCurrency Вы купили ${inputSum * rub2} сом');
      break;
    case 'KZT':
      print('На $inputSum $inputCurrency Вы купили ${inputSum * kzt2} сом');
      break;
    default:
      print('Ошибка! Указано неверное значение.');
      break;
  }
}
