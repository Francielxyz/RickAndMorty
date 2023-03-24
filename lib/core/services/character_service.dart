import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../ui/shared/utils/global.dart' as globals;
import '../apis/rick_and_morty_dio_config.dart';
import '../models/character_model.dart';

class CharacterService with ChangeNotifier {
  int _page = 1;
  Future<Dio> futureDio = RickAndMortyDioConfig.builderConfig();

  CharacterModel deserializePagedResponse(responseData) {
    return CharacterModel.fromJson(
      responseData,
    );
  }

  Future<List<CharacterModel>?> getRequest() async {
    Dio dio = await futureDio;
    try {
      var response = await dio.get('?page=$_page');
      _page++;

      return CharacterModel.fromJsonList(response.data['results']);
    } catch (e) {
      globals.errorSnackBar(
        message: 'Não foi possível realizar a busca',
      );
      return null;
    }
  }
}
