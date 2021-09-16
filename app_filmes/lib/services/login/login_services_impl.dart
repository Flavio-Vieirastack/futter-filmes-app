import 'package:app_filmes/repositories/login/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './login_services.dart';

class LoginServicesImpl implements LoginServices {

  LoginRepository _loginRepository;

  LoginServicesImpl({
    required LoginRepository loginRepository
    }) : _loginRepository = loginRepository;

  @override
  Future<UserCredential> login() => _loginRepository.login();
}
