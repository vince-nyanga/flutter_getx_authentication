import 'package:flutter/material.dart';
import 'package:flutter_getx_auth/features/home/home_controller.dart';
import 'package:flutter_getx_auth/models/models.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                AppLocalizations.of(context).welcomeMessage(user.name),
                style: TextStyle(
                    fontSize: 24
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text(AppLocalizations.of(context).signOut),
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