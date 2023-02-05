import 'package:dio/dio.dart';

class CharRepo {
  CharRepo({required this.dio});
  final Dio dio;
  Future<Response> getData({int? page, String? name}) async {
    return await dio.get('/api/character', queryParameters: {
      'page': page,
      'name': name,
    });
  }

  Future<Response> getDataFiltered(
      {int? page, String? name, String? status, String? gender}) async {
    return await dio.get('/api/character', queryParameters: {
      'page': page,
      'name': name,
      'status': status,
      'gender': gender
    });
  }

  Future<Response> getSingleCharacter({
    required int id,
  }) async {
    return await dio.get('/api/character/$id');
  }

  Future<Response> getLocations() async {
    return await dio.get('/api/location');
  }
}
