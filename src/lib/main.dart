import 'package:flutter/material.dart';
import 'package:flutter_getx_auth/features/features.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = Get.put(
    AuthenticationController(Get.put(FakeAuthenticationService())),
  );

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Obx(() {
        if (controller.state is UnAuthenticated) {
          return LoginPage();
        }
        if (controller.state is Authenticated) {
          return HomePage(
            user: (controller.state as Authenticated).user,
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }),
    );
  }
}