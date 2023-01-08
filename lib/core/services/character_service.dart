import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../ui/shared/utils/global.dart' as globals;
import '../apis/rick_and_morty_dio_config.dart';
import '../models/character_model.dart';

class CharacterService {
  Future<Dio> futureDio = RickAndMortyDioConfig.builderConfig();

  CharacterModel deserializePagedResponse(responseData) {
    return CharacterModel.fromJson(
      responseData,
    );
  }

  Future<List<CharacterModel>?> getRequest(BuildContext context) async {
    Dio dio = await futureDio;
    try {
      var response = await dio.get("");

      return CharacterModel.fromJsonList(response.data['results']);
    } catch (e) {
      globals.errorSnackBar(
        context: context,
        message: 'Não foi possível realizar a busca',
      );
      return null;
    }
  }
}
