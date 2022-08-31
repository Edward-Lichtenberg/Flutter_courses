//!Guess Numbers "Comparisons of guessing"
import 'dart:io';
import 'dart:math';
import 'print_color.dart';

void main(List<String> arguments) {
void main(List<String> arguments) {
  printBlue('Выберите игровой режим:');
  printRed('   1 - Число загадываете вы');
  printCyan('   2 - Битва за алгоритмов');
  printRed('   3 - Человек против машины');
  int choice = int.parse(stdin.readLineSync()!);
  if (choice == 1) {
    printRed('К сожилению, данный режим временно не доступно');
  } else if (choice == 2) {
    countTries();
  } else if (choice == 3) {
    printRed('К сожилению, данный режим временно не доступно');
  }
}

//Проверяем какой способ Лучше и Быстрее
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
    methodOne.add(user(test[i]));
    methodTwo.add(user_v2(test[i]));
  }
  for (int i = 0; i < test.length; i++) {
    sumOne += methodOne[i];
    sumTwo += methodTwo[i];
    printBlue('Получил Первый алгоритм ${test[i]} за ${methodOne[i]} шаги,');
    printMagenta('Получил Второй алгоритм ${test[i]} в ${methodTwo[i]} шаги');
  }
  if (sumTwo < sumOne) {
    printCyan('\nВторой алгоритм выигрывает');
  } else {
    printCyan('\nПервый алгоритм выигрывает');
  }
  print(
      'Первый алгоритм взял $sumOne пытается\nВторой алгоритм взял $sumTwo пытается');
}

//Первый алгоритм угадывания, когда число загадываете "Вы"
user(int testNumber) {
  // printBlue('Загадайте целое число от 0 до 100\n');
  // printCyan('Если ваше число:\n   Больше - нажмите 1');
  // printCyan('   Меньше - нажмите 2');
  // printCyan('   Равно  - нажмите 3');
  int min = 0;
  int max = 100;
  int try_count = 0;
  int trys_user = 0;
  //String input_user = '';
  do {
    trys_user++;
    try_count = ((min + max) / 2).round();
    //printBlue('\nВаше число $try_count?');
    //input_user = stdin.readLineSync()!;
    if (testNumber == try_count) {
      // printGreen('Я угадал число $try_count за $trys_user попыток\n\n');
      //break;
    }
    // if (try_count == min + 1 || try_count == max) {
    // printYellow('Вы мухлевщик! Я с вами больше не играю!\nИгра окончена!');
    // exit(200);
    // }
    else {
      if (testNumber > try_count) {
        min = try_count;
      } else if (testNumber < try_count) {
        max = try_count;
      } // else {
      // printRed('Ошибка! Ваше число вне диапазона 1 - 3');
      // }
    }
  } while (testNumber != try_count);
  return trys_user;
}

//Второй алгоритм угадывания, когда число загадываете "Вы"
user_v2(int testNumber) {
  // printBlue('Загадайте целое число от 0 до 100\n');
  // printCyan('Если ваше число:');
  // printCyan('   Больше - нажмите 1');
  // printCyan('   Меньше - нажмите 2');
  // printCyan('   Равно  - нажмите 3');
  Random random = new Random();
  int min = 0;
  int max = 100;
  int guess = 0;
  int trys_user_v2 = 0;
  // String input_user_v2 = '';

  do {
    trys_user_v2++;
    guess = min + random.nextInt(max - min);
    // printBlue('\nВаше число $guess?');
    // input_user_v2 = stdin.readLineSync()!;
    if (testNumber == guess) {
      // printGreen('Я угадал число $guess за $trys_user_v2 попыток\n\n');
      // break;
    }
    // if (guess == min + 1 && guess == max - 1 || guess == 0) {
    //   printYellow('Вы мухлевщик! Я с вами больше не играю!\nИгра окончена!');
    //   exit(200);
    // }
    else {
      if (testNumber > guess) {
        min = guess;
      } else if (testNumber < guess) {
        max = guess;
      }
      // else {
      //   print('Ошибка! Ваше число вне диапазона 1 - 3');
      // }
    }
  } while (testNumber != guess);
  return trys_user_v2;
}
