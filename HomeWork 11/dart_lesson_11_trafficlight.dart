//TrafficLight - Светофор
import 'dart:async';

enum ColorsLight { red, yellow, green }

void main() async {
  print('Загорелся Зеленный сигнал, Можно идти!');
  startTtimer(colorsLight: ColorsLight.green);
  // Future - позволяет запустить операцию после завершения предведущей с результатом вычисления.
  //.delayed - дает возможность указать задержку запуска
  await Future.delayed(
    const Duration(seconds: 25),
    () {
      startTtimer(colorsLight: ColorsLight.yellow);
    },
  );
  await Future.delayed(
    const Duration(seconds: 3),
    () {
      startTtimer(colorsLight: ColorsLight.red);
    },
  );
}

void startTtimer({required ColorsLight colorsLight}) {
  int greemTimer = 0;
  switch (colorsLight) {
    case ColorsLight.red:
      greemTimer = 20;
      break;
    case ColorsLight.yellow:
      greemTimer = 4;
      break;
    case ColorsLight.green:
      greemTimer = 26;
      break;
    default:
  }

  //Функия Timer - заключает в себе все что связано с временем
  Timer.periodic(Duration(seconds: 1), (timer) {
    print(greemTimer - timer.tick);

    if ((greemTimer - timer.tick) <= 3) {
      switch (colorsLight) {
        case ColorsLight.red:
          print('Скоро загориться Зеленный сигнал!');
          break;
        case ColorsLight.yellow:
          print('Скоро загориться Красный сигнал!');
          break;
        case ColorsLight.green:
          print('Скоро загориться Желтый сигнал!');
          break;
        default:
      }
      //print('Скоро загориться красный сигнал!');
    }
    if ((greemTimer - timer.tick) == 1) {
      switch (colorsLight) {
        case ColorsLight.red:
          print('\nЗагорелся Зеленный сигнал, Можно идти!');
          timer.cancel();
          break;
        case ColorsLight.yellow:
          print('\nЗагорелся Красный сигнал! Движение зпрещенно!');
          timer.cancel();
          break;
        case ColorsLight.green:
          print('\nЗагорелся Желтый сигнал, ВНИМАНИЕ!');
          timer.cancel();
          break;
        default:
      }
    }
  });
}
