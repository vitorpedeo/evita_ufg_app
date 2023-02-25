// Package imports:
import 'package:evita_ufg_app/app/data/services/auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/auth.dart';
import 'package:evita_ufg_app/app/data/services/storage.dart';
import 'package:evita_ufg_app/app/modules/login/repository.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';

class LoginController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
  final LoginRepository _repository = LoginRepository();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );

  RxBool isLoading = false.obs;

  Future<void> handleLogin(Map<String, dynamic> data) async {
    try {
      isLoading(true);

      await AuthService.instance.login(data);

      CustomSnack.show(
        message: 'Bem vindo!',
        type: CustomSnackType.success,
      );

      Get.offAllNamed('/home');
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> handleGoogleLogin() async {
    try {
      final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();

      if (googleAccount != null) {
        final Map<String, dynamic> data = {
          'id': googleAccount.id,
          'name': googleAccount.displayName,
          'email': googleAccount.email,
          'avatar_url': googleAccount.photoUrl,
        };

        final AuthModel auth = await _repository.postGoogleLogin(data);
        await _storageService.setUser(auth.user);
        await _storageService.setToken(auth.token);
        await _storageService.setAuthenticated(true);

        CustomSnack.show(
          message: 'Bem vindo!',
          type: CustomSnackType.success,
        );

        Get.offAllNamed('/home');
      }
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    } finally {
      //
    }
  }
}
