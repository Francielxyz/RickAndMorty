import 'package:dio/dio.dart';

class RickAndMortyDioConfig {
  static Future<Dio> builderConfig() async {
    Map<String, String> header = {
      "Content-Type": "application/json",
    };

    var options = BaseOptions(
      baseUrl: "https://rickandmortyapi.com/api/character",
      connectTimeout: 15000,
      receiveTimeout: 15000,
      headers: header,
    );

    Dio dio = Dio(options);
    return dio;
  }
}
