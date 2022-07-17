import 'package:dart_lesson_4/dart_lesson_4.dart' as dart_lesson_4;

void main(List<String> arguments) {
  /*1) Дан массив с числами [1, 7, 12, 3, 56, 2, 87, 34, 54].
  Выведите в конслоли превый, пятый и последний элемент списка. */
  List arrey = [1, 7, 12, 3, 56, 2, 87, 34, 54];

  print('№1');
  print(
      'Первый элемент - ${arrey.first}; Пятый элемент - ${arrey[4]}; Последний элемент - ${arrey.last}');
  print('');

  /*2) Даны два массива с числами [3, 12, 43, 1, 25, 6, 5, 7] и [55, 11, 23, 56, 78, 1, 9].
  Объедените данные массивы и выведите в консоли,  */

  List arrey1 = [3, 12, 43, 1, 25, 6, 5, 7];
  List arrey2 = [55, 11, 23, 56, 78, 1, 9];
  //arrey1.addAll(arrey2);
  arrey1.add(arrey2);
  print('№2');
  print('Объеденить данные массивов $arrey1');
  print('');

  /*3) Дан массив ['a','d','F','l','u','t','t','e','R','y','3','b','h','j'], 
  из данного массива необходимо вывести в консоли массив ['F','l','u','t','t','e','R'] */

  List strink = [
    'a',
    'd',
    'F',
    'l',
    'u',
    't',
    't',
    'e',
    'R',
    'y',
    '3',
    'b',
    'h',
    'j'
  ];

  //strink.removeRange(0, 2);
  //strink.removeRange(7, 12);
  print('№3');
  print('необходимо вывести - ${strink.sublist(2, 9)}');
  print('');

  /*4) выведите true если массивы слодержит цифру 3 [1, 2, 3, 4, 5, 6, 7],
  также покажите первый и последний элемент массива и его длину*/
  List arrey4 = [1, 2, 3, 4, 5, 6, 7];
  print('№4');
  print(
      'первый (${arrey4.first}) и последний элементы (${arrey4.last}) + Длина массива = ${arrey4.length}');
  print('В массиве есть цифра 3? ${arrey4.contains(3)}');
  print('');

  /*5) У вас есть список со значениями = [601 123, 2, "dart", 45, 95, "dart24", 1];
  Попробуйте определить содержит ли список такие элементы как: 1 – ‘dart’; 2 – 951; 3 - и dart, и 951
  Вы должны получить принты для задач:1 – true, 2 – false, 3 - true
  */
  Set list = {601, 123, 2, 'dart', 45, 95, 'dart24', 1};
  print('№5');
  print(
      'Cодержит ли список:dart? ${list.contains('dart')}; Cодержит ли список:951? ${list.contains('951')}; Cодержит ли список:dart и 951? ${list.contains(951) & list.contains("dart")}');
  print('');

  /*6) У вас есть список со значениями = [‘post’, 1, 0, ‘flutter’];
  И переменная String myDart = ‘Flutter’; 
  Попробуйте определить содержит ли список значение переменной myDart (Именно с большой буквы).
  Вы должны получить print со значением true;
  */
  List str = ['post', 1, 0, 'flutter'];
  String myDart = 'Flutter';
  print('№6');
  print(str.contains(myDart.toLowerCase()));
  print('');

  /*7) У вас есть список со значениями [“I”, “Started", "Learn", "Flutter", "Since", "April"];
И переменная String myFlutter = ‘’;
Задача: Объединить все элементы массива в одну строку и разделить каждое слово символом ‘*’ и сделать принт перменной myFlutter;
Print(myFlutter); В консоли вы должны получить: I * Started * Learn * Flutter * Since * April
 */

  Set str1 = {'I', 'Started', 'Learn', 'Flutter', 'Since', 'April'};
  String myFlutter;
  myFlutter = str1.join('*');
  print('№7');
  print(myFlutter);
  print('');

  /*8) У вас есть массив со значением = [1, 9, 3, 195, 202, 2, 5, 7, 9, 10, 3, 15, 0, 11];
  Ваша задача провести сортировку массива, чтобы все элементы начинались по возрастающей.
  Вы должны получить в консоли:[0, 1, 2, 3, 3, 5, 7, 9, 9, 10, 11, 15, 195, 202] */

  List<int> arr = [1, 9, 3, 195, 202, 2, 5, 7, 9, 10, 3, 15, 0, 11];
  arr.sort((a, b) => a.compareTo(b));
  print('№8');
  print('По возрастанию $arr');
}
