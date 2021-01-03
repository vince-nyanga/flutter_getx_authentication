import 'package:flutter/material.dart';
import 'package:flutter_getx_auth/features/authentication/authentication.dart';
import 'package:flutter_getx_auth/features/home/home_controller.dart';
import 'package:flutter_getx_auth/models/models.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final User user;
  final _controller = Get.put(HomeController());

  HomePage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Welcome, ${user.name}',
                style: TextStyle(
                    fontSize: 24
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('Logout'),
                onPressed: (){
                  _controller.signOut();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}