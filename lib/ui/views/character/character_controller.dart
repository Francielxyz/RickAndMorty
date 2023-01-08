import 'package:flutter/cupertino.dart';

import '../../../core/models/character_model.dart';
import '../../../core/services/character_service.dart';

class CharacterController {
  CharacterService service = CharacterService();
  final formKey = GlobalKey<FormState>();
  late List<CharacterModel>? characters = [];

  Future<List<CharacterModel>?> findAllCharacter(BuildContext context) async {
    return await service.getRequest(context);
  }
}
