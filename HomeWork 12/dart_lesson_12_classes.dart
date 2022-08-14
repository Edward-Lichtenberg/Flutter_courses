void main() {
  print('1) Country -  класс...');
  var zone = Country(name: 'Norfolk Island', climate: 'subtropical oceanic');
  print('${zone.name} - ${zone.climate}\n');

  print('2) Car -  имеет...');
  var car = Car(
      power: '700 horsepower', color: 'black', name: 'Lexus LC500', price: 190);
  car.carInfo();

  print('3) Класс Phone...');
  var apple =
      Phone(number: '1-467-214-7754', model: 'iPhone 13 Pro Max', weight: 238);
  var samsung =
      Phone(number: '1-743-969-6969', model: 'Galaxy S22 Ultra', weight: 228);
  var xiaomi =
      Phone(number: '7-777-878-9969', model: 'Xiaomi 12S Ultra', weight: 225);
  apple.phoneInfo();
  samsung.phoneInfo();
  xiaomi.phoneInfo();

  print(apple.receiveCall('Anna'));
  apple.getNumber();
  print(samsung.receiveCall('Joni'));
  samsung.getNumber();
  print(xiaomi.receiveCall('Earnest'));
  xiaomi.getNumber();

  samsung.call('Galaxy S21', 012457896431);
  xiaomi.sendMessage(01247856987);

  print('4) Определить класс Reader...');
  var readerInfo = Reader(
      name: 'Петров',
      lastName: 'Василюк',
      patronymic: 'Васильевич',
      ticket: 19897476121,
      birthday: 'Jul 25 1995',
      phoneNumber: 01247856987);

  readerInfo.takeBook(3);
  readerInfo.takeBook2(['Приключения', 'Словарь', 'Энциклопедия']);

  var books = Book(
      author: 'ООО «Кирилл и Мефодий»',
      booksName: 'Большая энциклопедия Кирилла и Мефодия');
  readerInfo.returnBook(3, ['Приключения', 'Словарь', 'Энциклопедия']);
  books.books();
}

/*  1) Country -  класс имеет поле название, климат (метод должен принтовать название места и климат)*/
class Country {
  String name;
  String climate;

  Country({
    required this.name,
    required this.climate,
  });

  @override
  String toString() => 'Country(name: $name, climate: $climate)';
}

/* 2) Car -  имеет поле мощность, цвет, название, цена (метод должен принтовать характеристики машины)*/
class Car {
  String power;
  String color;
  String name;
  double price;

  Car({
    required this.power,
    required this.color,
    required this.name,
    required this.price,
  });

  @override
  String toString() {
    return 'Car(power: $power, color: $color, name: $name, price: $price\n)';
  }

  void carInfo() {
    print(
        'The $name has $power, the color is $color for price $price dollars\n');
  }
}

/* 3) Класс Phone.
 Создайте класс Phone, который содержит переменные number, model и weight. Создайте три экземпляра этого класса. Добавить конструктор в класс Phone, который принимает на вход три параметра для инициализации переменных класса - number, model и weight.*/
class Phone {
  String number;
  String model;
  double weight;

  Phone({
    required this.number,
    required this.model,
    required this.weight,
  });

  // Выведите на консоль значения их переменных.
  void phoneInfo() {
    print('The phone $model has weight $weight and number $number');
  }

  /* Добавить в класс Phone методы: receiveCall, имеет один параметр – имя звонящего. Выводит на консоль сообщение “Звонит {name}”. Метод getNumber – возвращает номер телефона. Вызвать эти методы для каждого из объектов.*/
  String receiveCall(String name) {
    return ('\nЗвонит: $name');
  }

  void getNumber() {
    print(number);
  }

  /* Добавить конструктор, который принимает на вход два параметра для инициализации переменных класса - number, model.
  Добавить конструктор без параметров.*/
  void call(String model, int number) {
    print('\nВам звонит $model с номером $number');
  }

  /* Создать метод sendMessage с аргументами переменной длины. Данный метод принимает на вход номера телефонов, которым будет отправлено сообщение. Метод выводит на консоль номера этих телефонов.*/

  void sendMessage(int number) {
    print('\n$number\n');
  }
}

/*4) Определить класс Reader, хранящий такую информацию о пользователе библиотеки: ФИО, номер читательского билета, факультет, дата рождения,телефон.*/
class Reader {
  String name;
  String lastName;
  String patronymic;
  int ticket;
  String birthday;
  int phoneNumber;

  Reader({
    required this.name,
    required this.lastName,
    required this.patronymic,
    required this.ticket,
    required this.birthday,
    required this.phoneNumber,
  });

/* Методы takeBook(), returnBook().
Разработать программу, в которой создается массив объектов данного класса.
Перегрузить методы takeBook(), returnBook():
- takeBook, который будет принимать количество взятых книг. Выводит на консоль сообщение "Петров В. В. взял 3 книги".*/
  void takeBook(int takeBook) {
    print('$name ${lastName[0]}. ${patronymic[0]}. взял $takeBook книги');
  }

/* - takeBook, который будет принимать переменное количество названий книг. Выводит на консоль сообщение "Петров В. В. взял книги: Приключения, Словарь, Энциклопедия".*/
  void takeBook2(List books) {
    print(
        '$name ${lastName[0]}. ${patronymic[0]}. взял книги: ${books[0]}, ${books[1]}, ${books[2]}');
  }

/*Аналогичным образом перегрузить метод returnBook(). Выводит на консоль сообщение "Петров В. В. вернул книги: Приключения, Словарь, Энциклопедия". Или  "Петров В. В. вернул 3 книги".*/
  void returnBook(int returnBook, List books) {
    print('\n$name ${lastName[0]}. ${patronymic[0]}. вернул $returnBook книги');
    print(
        '$name ${lastName[0]}. ${patronymic[0]}. вернул книги: ${books[0]}, ${books[1]}, ${books[2]}');
  }
}

// - takeBook, который будет принимать переменное количество объектов класса Book (создать новый класс, содержащий имя и автора книги). Выводит на консоль сообщение "Петров В. В. взял книги: Приключения, Словарь, Энциклопедия".
class Book {
  String author;
  String booksName;

  Book({
    required this.author,
    required this.booksName,
  });

  void books() {
    print('\nBook - $booksName, Author - $author');
  }
}
