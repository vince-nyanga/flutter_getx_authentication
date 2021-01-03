import 'package:flutter_getx_auth/models/models.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


class LoginState extends Equatable{
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;

  LoginSuccess(this.user);
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];
}