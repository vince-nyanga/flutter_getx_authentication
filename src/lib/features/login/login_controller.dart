import 'package:flutter_getx_auth/features/authentication/authentication.dart';
import 'package:flutter_getx_auth/features/login/login_state.dart';
import 'package:get/get.dart';

class LoginController  extends GetxController {
  final AuthenticationController _authenticationController = Get.find();
  final _loginStateStream = LoginState().obs;

  LoginState get state => _loginStateStream.value;

  void login(String email, String password) async {
    _loginStateStream.value = LoginLoading();

    try{
      await _authenticationController.signIn(email, password);
    } on AuthenticationException catch(e){
      _loginStateStream.value = LoginFailure(error: e.message);
    }
  }
}