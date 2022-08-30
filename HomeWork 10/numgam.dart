import 'dart:async';
import 'dart:io';

import 'dart:math';

void main(List<String> arguments) {
  print('Выберите игровой режим:n Битва за алгоритмы');
  countTries();
}

void countTries() {
  List<int> test = [];
  Random random = Random();
  for (int i = 0; i < 100; i++) {
    int a = random.nextInt(100);
    test.add(a);
  }
  num sumOne = 0;
  num sumTwo = 0;
  List methodOne = [];
  List methodTwo = [];
  for (int i = 0; i < test.length; i++) {
    methodOne.add(guessNumber(test[i]));
    methodTwo.add(guessNumber2(test[i]));
  }
  for (int i = 0; i < test.length; i++) {
    sumOne += methodOne[i];
    sumTwo += methodTwo[i];

    print(
        'Шаги, который получил Первый алгоритм${test[i]} в ${methodOne[i]} Шаги, который получил Второй алгоритм ${test[i]} в ${methodTwo[i]} шаги ');
  }
  if (sumTwo < sumOne) {
    print('\n\nВторой алгоритм выигрывает');
  } else {
    print('\n\nПервый алгоритм выигрывает');
  }
  print('\nПервый алгоритм взял $sumOne пытается\n');
  print('\nВторой алгоритм взял $sumTwo пытается\n');
}

int guessNumber(int testNumber1) {
  int a = 50;
  int a2 = 50;
  //print('Загадайте число:');
  //int number = int.parse(stdin.readLineSync()!);
  int b = 0;
  int tryCount = 0;
  void guess() {
    a2 = (a2 / 2).round();
    //print('Загаданное число это $a?\n1) Да\n2)Больше\n3)Меньше');
    tryCount++;
    if (testNumber1 > a) {
      a = a + a2;
      if (a > 100) {
        a = 100;
      }
    } else if (testNumber1 < a) {
      a = a - a2;
      if (a > 100) {
        a = 100;
      }
      /*b = int.parse(stdin.readLineSync()!);
    a2 = (a2 / 2).round();
    if (b == 2) {
      a = a + a2;
      if (a > 100) {
        a = 100;
      }
    } else if (b == 3) {
      a = a - a2;
      if (a < 0) {
        a = 0;
      }
    }*/
    }
  }

  do {
    guess();
  } while (testNumber1 != a);
  return tryCount;
}

int guessNumber2(int testNumber2) {
  String a = testNumber2.toString();
  List b = a.split('');
  int count = 0;
  void guess(int g1) {
    int a = 5;
    int b = 2;
    b = (b / 2).round();
    do {
      if (g1 > a) {
        a = a + b;
        if (a > 9) {
          a = 9;
        }
      } else if (g1 < a) {
        a = a - b;
        if (a <= 0) {
          a = 0;
        }
      }
      count++;
    } while (g1 != a);
  }

  count++;
  if (testNumber2 <= 9) {
    guess(testNumber2);
  } else if (testNumber2 > 10) {
    guess(int.parse(b[0]));
    guess(int.parse(b[1]));
  }
  return count;
}
