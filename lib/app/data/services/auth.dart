import 'package:evita_ufg_app/app/data/models/user.dart';
import 'package:evita_ufg_app/app/data/repositories/auth.dart';
import 'package:evita_ufg_app/app/data/services/storage.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';
import 'package:evita_ufg_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rxn<UserModel> user = Rxn<UserModel>(null);
  final RxBool isAuthenticated = false.obs;

  static AuthService get instance => Get.find<AuthService>();

  @override
  void onInit() {
    super.onInit();

    getUserFromStorage();
  }

  Future<bool> register(Map<String, dynamic> data) async {
    final String? name = data['name'];
    final String? email = data['email'];
    final String? password = data['password'];

    try {
      if ([name, email, password].contains(null) ||
          [name, email, password].contains('')) {
        throw Exception('Os campos nome, email e senha são obrigatórios');
      }

      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      user.value = await _authRepository.newUser(
        firebaseUser: userCredential.user,
        additionalInfo: {'name': name},
      );
      isAuthenticated.value = true;

      updateStorage();

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomSnack.show(
          message: 'A senha informada é fraca.',
          type: CustomSnackType.error,
        );
      } else if (e.code == 'email-already-in-use') {
        CustomSnack.show(
          message: 'O e-mail informado já está em uso.',
          type: CustomSnackType.error,
        );
      } else if (e.code == 'invalid-email') {
        CustomSnack.show(
          message: 'O e-mail informado é inválido.',
          type: CustomSnackType.error,
        );
      } else {
        CustomSnack.show(
          message: e.toString(),
          type: CustomSnackType.error,
        );
      }

      return false;
    } on Exception catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );

      return false;
    }
  }

  Future<bool> login(Map<String, dynamic> data) async {
    final String? email = data['email'];
    final String? password = data['password'];

    try {
      if ([email, password].contains(null) || [email, password].contains('')) {
        throw Exception('Email e senha são obrigatórios');
      }

      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      final UserModel? userFound = await _authRepository.getUser(
        id: userCredential.user?.uid,
      );

      if (userFound == null) {
        throw Exception('Usuário não encontrado');
      }

      user.value = userFound;
      isAuthenticated.value = true;

      updateStorage();

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        CustomSnack.show(
          message: 'E-mail/senha inválido(s).',
          type: CustomSnackType.error,
        );
      } else if (e.code == 'invalid-email') {
        CustomSnack.show(
          message: 'O e-mail informado é inválido.',
          type: CustomSnackType.error,
        );
      } else {
        CustomSnack.show(
          message: e.toString(),
          type: CustomSnackType.error,
        );
      }

      return false;
    } on Exception catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );

      return false;
    }
  }

  Future<bool> googleLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final UserModel? userFound = await _authRepository.getUser(
        id: userCredential.user?.uid,
      );

      if (userFound != null) {
        user.value = userFound;
      } else {
        user.value = await _authRepository.newUser(
          firebaseUser: userCredential.user,
          additionalInfo: {
            'name': userCredential.user?.displayName,
          },
        );
      }

      isAuthenticated.value = true;

      updateStorage();

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        CustomSnack.show(
          message: 'A conta já existe com um provedor diferente.',
          type: CustomSnackType.error,
        );
      } else if (e.code == 'invalid-credential') {
        CustomSnack.show(
          message: 'As credenciais informadas são inválidas.',
          type: CustomSnackType.error,
        );
      } else if (e.code == 'user-disabled') {
        CustomSnack.show(
          message: 'O usuário está desabilitado.',
          type: CustomSnackType.error,
        );
      } else if (e.code == 'user-not-found') {
        CustomSnack.show(
          message: 'O usuário não foi encontrado.',
          type: CustomSnackType.error,
        );
      } else if (e.code == 'wrong-password') {
        CustomSnack.show(
          message: 'A senha informada está incorreta.',
          type: CustomSnackType.error,
        );
      } else if (e.code == 'invalid-verification-code') {
        CustomSnack.show(
          message: 'O código de verificação informado é inválido.',
          type: CustomSnackType.error,
        );
      } else if (e.code == 'invalid-verification-id') {
        CustomSnack.show(
          message: 'O ID de verificação informado é inválido.',
          type: CustomSnackType.error,
        );
      } else {
        CustomSnack.show(
          message: e.toString(),
          type: CustomSnackType.error,
        );
      }

      return false;
    } on Exception catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );

      return false;
    }
  }

  Future<bool> logout() async {
    try {
      await _auth.signOut();

      user.value = null;
      isAuthenticated.value = false;

      clearStorage();

      Get.offAllNamed(Routes.login);

      return true;
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );

      return false;
    }
  }

  Future<void> getUserFromStorage() async {
    UserModel? userFromStorage = await StorageService.instance.getUser();

    if (userFromStorage != null) {
      user.value = userFromStorage;
      isAuthenticated.value = true;
    }
  }

  void updateStorage() async {
    StorageService.instance.setUser(user.value);
    StorageService.instance.setAuthenticated(isAuthenticated.value);
  }

  void clearStorage() async {
    StorageService.instance.clear();
  }
}
