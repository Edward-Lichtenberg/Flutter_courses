//настройки Dio для пользования
import 'package:dio/dio.dart';

class DioSettings {
  // вызываем setup когда создается класс
  DioSettings() {
    setup();
  }
  Dio dio = Dio(
    // BaseOptions(baseUrl: 'https://pokeapi.co'),
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com',
      receiveTimeout: 15000,
      connectTimeout: 15000,
    ),
  );

  void setup() {
    final interceptors = dio.interceptors;
    interceptors.clear(); //очистили
//созданили новые и настроили логи
    final logInterceptor = LogInterceptor(
      request: true,
      error: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );

    interceptors.addAll([logInterceptor]);
  }
}
