import 'package:app_filmes/application/ui/loader/Loader_mixin.dart';
import 'package:app_filmes/application/ui/messages/messagens_mixin.dart';
import 'package:app_filmes/services/login/login_services.dart';
import 'package:get/get.dart';

class LoguinController extends GetxController with LoaderMixin, MessagensMixin {
  final LoginServices _loginService;
  final loaderRx = false.obs;
  final message = Rxn<MessageModel>();

  LoguinController({
    required LoginServices loginServices,
  }) : _loginService = loginServices;

  @override
  void onInit() {
    super.onInit();
    loaderListner(loaderRx);
    messageListner(message);
  }

  Future<void> Loguin() async {
    try {
      loaderRx(true);

      await _loginService.login();
      loaderRx(false);
      message(MessageModel.info(
          title: "Sucesso", message: "Login Realizado Com Sucesso"));
    } catch (e, s) {
      print(e);
      print(s);
      loaderRx(false);
      message(MessageModel.error(title: "Erro", message: "Erro no login"));
    }
  }
}
