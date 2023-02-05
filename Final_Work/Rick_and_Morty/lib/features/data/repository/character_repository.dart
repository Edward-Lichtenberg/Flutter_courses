import 'package:dio/dio.dart';

abstract class CharacterRepository {
  Future<Response> getData(int? page, String? name);

  Future<Response> getDataFiltered(
      {int? page, String? name, String? status, String? gender});

  Future<Response> getSingleCharacter({
    required int id,
  });
}

