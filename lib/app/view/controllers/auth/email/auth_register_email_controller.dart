import 'package:eventus/app/data/b4a/auth/auth_repository_exception.dart';
import 'package:eventus/app/data/repositories/auth_repository.dart';
import 'package:eventus/app/routes.dart';
import 'package:eventus/app/view/controllers/utils/loader_mixin.dart';
import 'package:eventus/app/view/controllers/utils/message_mixin.dart';
import 'package:get/get.dart';

class AuthRegisterEmailController extends GetxController
    with LoaderMixin, MessageMixin {
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final AuthRepository _authRepository;
  AuthRegisterEmailController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> registerEmail({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authRepository.registerEmail(
        email: email,
        password: password,
      );
      _loading(true);
      //print('após registerEmail ');
      if (user != null) {
        //print('Success register');
        Get.offAllNamed(Routes.authLogin);
      } else {
        //print('user==null in register');
        // _authUseCase.logout();
        _message.value = MessageModel(
          title: 'Erro',
          message: 'Em registrar usuário',
          isError: true,
        );
      }
    } on AuthRepositoryException {
      //print('error em  registerEmail');
      _authRepository.logout();
      _message.value = MessageModel(
        title: 'AuthRepositoryException',
        message: 'Em registrar usuário',
        isError: true,
      );
    } finally {
      _loading(false);
    }
  }
}
