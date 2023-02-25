import 'package:evita_ufg_app/app/data/models/user.dart';
import 'package:evita_ufg_app/app/data/repositories/auth.dart';
import 'package:evita_ufg_app/app/data/services/storage.dart';
import 'package:evita_ufg_app/app/widgets/custom_snack.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? user;
  bool isAuthenticated = false;

  static AuthService get instance => Get.find<AuthService>();

  // @override
  // void onInit() {
  //   super.onInit();

  //   _firebaseUser.bindStream(_auth.authStateChanges());

  //   ever(
  //     _firebaseUser,
  //     (User? user) async {
  //       if (user != null) {
  //         isAuthenticated.value = true;
  //       } else {
  //         isAuthenticated.value = false;
  //       }
  //     },
  //   );
  // }

  Future<void> register(Map<String, dynamic> data) async {
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

      user = await _authRepository.newUser(
        firebaseUser: userCredential.user,
        additionalInfo: {'name': name},
      );
      isAuthenticated = true;

      updateStorage();
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
    } on Exception catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    }
  }

  Future<void> login(Map<String, dynamic> data) async {
    final String? email = data['email'];
    final String? password = data['password'];

    try {
      if ([email, password].contains(null) || [email, password].contains('')) {
        throw Exception('Email and password are required');
      }

      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      user = await _authRepository.getUser(
        id: userCredential.user?.uid,
      );
      isAuthenticated = true;

      updateStorage();
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
    } on Exception catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();

      user = null;
      isAuthenticated = false;

      updateStorage();
    } catch (e) {
      CustomSnack.show(
        message: e.toString(),
        type: CustomSnackType.error,
      );
    }
  }

  void updateStorage() async {
    StorageService.instance.setUser(user);
    StorageService.instance.setAuthenticated(isAuthenticated);
  }
}
