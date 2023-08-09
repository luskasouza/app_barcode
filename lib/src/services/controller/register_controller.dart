import '../../models/register_model.dart';
import '../database/database.dart';

class RegisterController {
  static Future<void> add({required String code}) async {
    await create(Register(0, code, 'active'))
        .then((value) => print('Register: $value'));
  }
}
