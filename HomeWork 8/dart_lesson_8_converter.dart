import 'dart:io';
import 'buy_som.dart';
import 'sell_som.dart';

void main() {
  //продажа
  double usd1 = 83.00;
  double eur1 = 85.80;
  double rub1 = 1.430;
  double kzt1 = 0.1180;
  //покупка
  double usd2 = 82.00;
  double eur2 = 84.72;
  double rub2 = 1.345;
  double kzt2 = 0.1130;
  exchangeRate(usd1, eur1, rub1, kzt1, usd2, eur2, rub2, kzt2);
  print('1 - Хотите продать сом?');
  print('2 - Хотите купить сом?');
  print('Ввод: ');
  int inputNumber = int.parse(stdin.readLineSync()!);

  if (inputNumber == 1) {
    sellSom(usd1, eur1, rub1, kzt1);
  } else if (inputNumber == 2) {
    buySom(usd2, eur2, rub2, kzt2);
  } else {
    print('Ошибка! Указано неверное значение.');
  }
}

//valutaNames
void exchangeRate(double usd1, double eur1, double rub1, double kzt1,
    double usd2, double eur2, double rub2, double kzt2) {
  print('Курс на сегодня:');
  print('Американский доллар: продажа $usd1 сом / покупка $usd2');
  print('Евро: продажа                $eur1 сом / покупка $eur2');
  print('Российский рубль: продажа    $rub1 сом / покупка $rub2');
  print('Казахский тенге: продажа     $kzt1 сом / покупка $kzt2\n');
}

//Abbreviation
void abbreviation() {
  print('USD');
  print('EUR');
  print('RUB');
  print('KZT');
  print('Ввод: ');
}