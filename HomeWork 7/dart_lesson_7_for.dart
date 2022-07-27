void main() {
/*1 - Дан массив с числами. Проверьте, есть ли в нем два одинаковых числа не подряд. Если есть - выведите 'да', а если нет - выведите 'нет'.*/
  List<int> arrey = [1, 5, 1, 6, 8, 1, 8, 9];
  List duplicate = [];
  arrey.forEach((u) {
    if (duplicate.contains(u)) {
      print('Да! Повторяються $u');
    } else
      duplicate.add(u);
  });

/*2 - Дан массив с числами - List<int> list = [1, 2, 3, 4, 0, 5, 5, 7]; Напишите функцию и передайте ей массив в качестве параметра. Функция должна вернуть вам среднее арифметическое данного массива, вы должны получить - 3.375.*/
  List<double> list1 = [1, 2, 3, 4, 0, 5, 5, 7];
  double result = arithmeticMean(list1);
  print('Cреднее арифметическое $result');

/*3 - Дан массив с числами - List<int> list = [1, 5, 3, 2, 2, 5, 6, 1, 2, 3];. Напишите функцию, которая вернет вам длинну этого массива - вы должны получить 10. Использовать lenght ЗАПРЕЩАЕТСЯ. */
  List<int> list2 = [1, 5, 3, 2, 2, 5, 6, 1, 2, 3];
  length(list2);

/*4 - Дан массив со значениями - List<dynamic> list = [1, '2', true, 1, 4, false, 'qwerty'];. Напишите функцию, которая будет определять тип данных каждого элемента и закидывать значение в другой массив. Вы должны получить - [int, String, bool, int, int, bool, String].*/

  List<dynamic> list3 = [1, '2', true, 1, 4, false, 'qwerty'];
  type(list3);
}

//2
double arithmeticMean(List<double> list1) {
  double sum = list1.reduce((sum, el) =>
      sum +
      el); //выполняется функция для каждого элемента по порядку, передавая возвращаемое значение из вычисление предыдущего элемента.
  return sum / list1.length;
}

//3
void length(list2) {
  int x = 0;
  for (var n in list2) {
    x++;
  }
  print('Дилна массива = $x');
}

//4
void type(List<dynamic> list3) {
  List types = [];
  list3.forEach((element) {
    types.add(element.runtimeType.toString());
  });
  print(types);
}
