import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_auth/features/login/login_controller.dart';
import 'package:flutter_getx_auth/features/login/login_state.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: _SignInForm(),
        ));
  }
}


class _SignInForm extends StatefulWidget {
  @override
  __SignInFormState createState() => __SignInFormState();
}

class __SignInFormState extends State<_SignInForm> {
  final controller = LoginController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Form(
        key: _key,
        autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email address',
                  filled: true,
                  isDense: true,
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (value) {
                  if (value == null) {
                    return 'Email is required.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  isDense: true,
                ),
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null) {
                    return 'Password is required.';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                padding: const EdgeInsets.all(16),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
                child: Text('LOG IN'),
                onPressed: controller.state is LoginLoading ? () {} : _onLoginButtonPressed,
              ),
              const SizedBox(height: 20,),
              if (controller.state is LoginFailure)
                Text((controller.state as LoginFailure).error,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Get.theme.errorColor
                  ),
                ),
              if (controller.state is LoginLoading)
                Center(child: CircularProgressIndicator(),)
            ],
          ),
        ),
      );
    });
  }

  _onLoginButtonPressed() {
    if (_key.currentState.validate()) {
      controller.login(_emailController.text, _passwordController.text);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}