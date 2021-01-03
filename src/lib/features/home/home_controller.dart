import 'package:flutter_getx_auth/features/authentication/authentication.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AuthenticationController _authenticationController = Get.find();

  void signOut(){
    _authenticationController.signOut();
  }
}