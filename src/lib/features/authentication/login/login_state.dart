import 'package:equatable/equatable.dart';
import 'package:flutter_getx_auth/models/models.dart';
import 'package:meta/meta.dart';

class LoginState extends Equatable{
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];
}
