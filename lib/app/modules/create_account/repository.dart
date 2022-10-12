// Project imports:
import 'package:evita_ufg_app/app/data/services/api.dart';

class CreateAccountRepository {
  final ApiService _apiService = ApiService();

  Future<void> postNewAccount(Map<String, dynamic> data) async {
    await _apiService.getApi().post('/auth/register', data: data);
  }
}
