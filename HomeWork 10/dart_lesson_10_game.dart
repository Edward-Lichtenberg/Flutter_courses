//!Guess Numbers "User", "PC", "User_vs_PC"
import 'dart:io';
import 'dart:math';

import 'print_color.dart';

void main() {
  printBlue('\nВыберите режим игры:\n');
  printCyan('   1 - Число загадываете вы');
  printCyan('   2 - Число загадыват компуктер');
  printCyan('   3 - Человек против машины');
  int chose_number = int.parse(stdin.readLineSync()!);
  if (chose_number == 1) {
    printMagenta('Режим: Число загадываете вы!');
    printBlue('\nВыберите сложность:\n');
    printCyan('   1 - Компуктер угадает ваше число быстрее');
    printCyan('   2 - Компуктеру будет сложнее угадать ваше число');
    String complexity = stdin.readLineSync()!;
    if (complexity == '1') {
      user();
    } else if (complexity == '2') {
      user_v2();
    } else {
      printRed('Ошибка! Число $complexity вне диапазона');
    }
  } else if (chose_number == 2) {
    printMagenta('Режим: Число загадывает компуктер');
    pc();
  } else if (chose_number == 3) {
    printMagenta('Режим: Человек против машины');
    vs();
  } else {
    printRed('Ошибка! Число $chose_number вне диапазона');
  }
}

// Первый вариант игры, когда число загадываете Вы
user() {
  printBlue('Загадайте целое число от 0 до 100\n');
  printCyan('Если ваше число:\n   Больше - нажмите 1');
  printCyan('   Меньше - нажмите 2');
  printCyan('   Равно  - нажмите 3');
  int min = 0;
  int max = 100;
  int try_count = 0;
  int trys_user = 0;
  String input_user = '';
  do {
    trys_user++;
    try_count = ((min + max) / 2).round();
    printBlue('\nВаше число $try_count?');
    input_user = stdin.readLineSync()!;
    if (input_user == '3') {
      printGreen('Я угадал число $try_count за $trys_user попыток\n\n');
      break;
    }
    if (try_count == min + 1 || try_count == max) {
      printYellow('Вы мухлевщик! Я с вами больше не играю!\nИгра окончена!');
      exit(200);
    } else {
      if (input_user == '1') {
        min = try_count;
      } else if (input_user == '2') {
        max = try_count;
      } else {
        printRed('Ошибка! Ваше число вне диапазона 1 - 3');
      }
    }
  } while (input_user != '3');
  return trys_user;
}

// Второй вариант игры, когда число загадываете Вы
user_v2() {
  printBlue('Загадайте целое число от 0 до 100\n');
  printCyan('Если ваше число:');
  printCyan('   Больше - нажмите 1');
  printCyan('   Меньше - нажмите 2');
  printCyan('   Равно  - нажмите 3');
  Random random = new Random();
  int min = 0;
  int max = 100;
  int trys_user_v2 = 0;
  String input_user_v2 = '';

  do {
    trys_user_v2++;
    int guess = min + random.nextInt(max - min);
    printBlue('\nВаше число $guess?');
    input_user_v2 = stdin.readLineSync()!;
    if (input_user_v2 == '3') {
      printGreen('Я угадал число $guess за $trys_user_v2 попыток\n\n');
      break;
    }
    if (guess == min + 1 && guess == max - 1 || guess == 0) {
      printYellow('Вы мухлевщик! Я с вами больше не играю!\nИгра окончена!');
      exit(200);
    } else {
      if (input_user_v2 == '1') {
        min = guess;
      } else if (input_user_v2 == '2') {
        max = guess;
      } else {
        print('Ошибка! Ваше число вне диапазона 1 - 3');
      }
    }
  } while (input_user_v2 != '3');
  return trys_user_v2;
}

//Число загадывает компьютер, Вы отгадываете
pc() {
  printBlue('Угадайте число от 1 до 100');
  Random random = new Random();
  int unknown_number = random.nextInt(100);
  int trys_pc = 0;
  int input_number = 0;
  do {
    trys_pc++;
    printCyan('\nВведите ваше число:');
    input_number = int.parse(stdin.readLineSync()!);
    if (input_number > unknown_number) {
      print('Ваше число больше загаданного');
    } else if (input_number < unknown_number) {
      print('Ваше число меньше загаданного');
    } else {
      printGreen(
          'ПОЗДРАВЛЯЮ!\nВы угадали число: $unknown_number за $trys_pc попыток\n\n');
      break;
    }
  } while (input_number != unknown_number);
  return trys_pc;
}

// Вы сражаетесь с компьютером в интуиции)
void vs() {
  int user_roundWins = 0;
  int pc_roundWins = 0;
  int count = 0;
  printBlue(
      'Выберите количество раундов от 1 до 10\nКоличество раундов по умолчанию - 3');
  String round = stdin.readLineSync()!;
  if (round == '') {
    round = '3';
  } else if (int.parse(round) > 10) {
    printRed('Ошибка! Вы выбрали число больше 10\n');
    printBlue('Выберите количество раундов от 1 до 10');
    String round = stdin.readLineSync()!;
  } else if (int.parse(round) <= 0) {
    printRed('Ошибка! Вы выбрали 0 раундов\n');
    printBlue('Выберите количество раундов от 1 до 10');
    String round = stdin.readLineSync()!;
  }
//Цикл раундов PCvsUser
  do {
    print('$count $round');
    count++;
    printCyan('\n----------Раунд: $count----------');
    printMagenta('===Компуктер отгадывает ваше число!===');
    int user_score = user();
    printMagenta('===Ваш черёд отгатать число компуктера!===');
    int pc_score = pc();
    if (pc_score > user_score) {
      printRed('Вы проиграли, $count Раунд!');
      pc_roundWins++;
    } else if (pc_score < user_score) {
      printGreen('Вы выиграли, $count Раунд');
      user_roundWins++;
    } else {
      printYellow('Ничья!');
    }
    //Результат раунда
    printMagenta('user - ${pc_score}\npc - ${user_score}');
  } while (count != int.parse(round));
  //Итоговый Реузултат Всех Раундов
  printCyan('\nЗа количество раундов: $round');
  if (pc_roundWins > user_roundWins) {
    printMagenta(
        'user проиграл - $pc_roundWins \npc проиграл - $user_roundWins');
    printGreen(
        'ПОЗДРАВЛЯЮ!\nКомпьютер выиграл игру! Со счетом  $pc_roundWins:$user_roundWins');
  } else if (pc_roundWins < user_roundWins) {
    printMagenta(
        'user проиграл - $pc_roundWins \npc проиграл - $user_roundWins');
    printGreen(
        'ПОЗДРАВЛЯЮ!\nВы выиграли игру! Cо счетом  $user_roundWins:$pc_roundWins');
  } else if (pc_roundWins == user_roundWins) {
    printMagenta(
        'user проиграл - $pc_roundWins \npc проиграл - $user_roundWins');
    printYellow('\nНИЧЬЯ! Победила Дружба!');
  }
}
