import 'dart:io';

void main() {
//1
  print('№1');
  print('Введите число которое хотите возвести в квадрат');
  int first1 = int.parse(stdin.readLineSync()!);
  print('Результат: ${exponentiate(first1: first1)}\n');

//2
  print('№2');
  print('Введите первое число');
  int first2 = int.parse(stdin.readLineSync()!);
  print('Введите второе число');
  int second2 = int.parse(stdin.readLineSync()!);
  print('Сумма: ${summa(first2: first2, second2: second2)}\n');

//3
  print('№3');
  print('Введите первое число');
  int first3 = int.parse(stdin.readLineSync()!);
  print('Введите второе число');
  int second3 = int.parse(stdin.readLineSync()!);
  print('Введите третье число');
  int third = int.parse(stdin.readLineSync()!);
  if (third != '0' && third == 0) {
    print('Ошибка! На ноль делить нельзя!');
    exit(200);
  }
  print(
      'Результат: ($first3 - $second3)/$third = ${sum(first3: first3, second3: second3, third: third)} \n');

//5
  print('№4');
  print('Введите количество минут');
  int minutes = int.parse(stdin.readLineSync()!);
  print('В $minutes мин. = ${seconds(minutes: minutes)} секунд\n');

//6
  print('№5');
  oneNumber();
  print('\n');

//7
  print('№6');
  bool x = false;
  trueFalse(x);
//8
  print('№7');
  print('Введите число: ');
  int single = int.parse(stdin.readLineSync()!);
  print(number(single));

//9
  print('\n№8');
  List<int> arrey = [1, 5, 6, 8, 8, 9];
  dublicat(arrey);
}

/*1)Сделайте функцию, которая возвращает квадрат числа. Число передается параметром.*/
int exponentiate({required int first1}) => first1 * first1;

/*2)Сделайте функцию, которая возвращает сумму двух чисел.*/
int summa({required int first2, required int second2}) => first2 + second2;

/*3)Сделайте функцию, которая отнимает от первого числа второе и делит на третье.*/
double sum({required int first3, required int second3, required int third}) =>
    (first3 - second3) / third;

/*4)Напишите функцию, которая принимает целые минуты и преобразует их в секунды.*/
int seconds({required int minutes}) => minutes * 60;

/*5)Есть массив, List array = [1, 3, 4, 5, 6]; возвратите его первый элемент*/
void oneNumber() {
  List<int> array = [1, 2, 3, 4, 5, 6];
  print('Данное ${array.first} число является первым числом в массиве ');
}

/*6)Создайте bool переменную и напишите условие (if…else), выведите сообщение «Переменная имеет значение (значение вашей переменной)*/
bool trueFalse(x) {
  if (x == true) {
    print('Переменная "x" имеет значение $x\n');
    return true;
  } else {
    print('Переменная "x" имеет значение $x\n');
    return false;
  }
}

/*7)Создайте функцию, которая принимает число в качестве единственного аргумента и возвращает true, если оно меньше или равно нулю, в противном случае возвращает false.*/
bool number(single) {
  if (single <= 0) {
    print('Данное число $single<=0 ?');
    return true;
  } else {
    print('Данное число $single<=0 ?');
    return false;
  }
}

/*8)Дан массив с числами. Проверьте, есть ли в нем два одинаковых числа подряд. Если есть - выведите 'да', а если нет - выведите 'нет'.
*/
void dublicat(List<int> arrey) {
  bool trueF = false;

  for (var i = 0; i <= arrey.length; i++) {
    for (var j = i + 1; j < arrey.length; j++) {
      if (arrey[i++] == arrey[i]) {
        print('Да ${arrey[i]} повторяется');
      } else {
        print('Нет');
      }
    }
  }
}
