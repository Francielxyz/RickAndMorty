import 'package:flutter/cupertino.dart';

import '../../../core/services/character_service.dart';

class CharacterController {
  CharacterService service = CharacterService();
  final formKey = GlobalKey<FormState>();
  double width = 0;
  double height = 0;
}