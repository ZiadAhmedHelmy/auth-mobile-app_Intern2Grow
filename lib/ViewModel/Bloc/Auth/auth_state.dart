part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}



// LoginState
class LoginLoadingState extends AuthState {}
class LoginSuccessState extends AuthState {}
class LoginErrorState extends AuthState {}



// rememberMe State


class RememberMeState extends AuthState {}
class DoNotRememberMeState extends AuthState {}




class RememberMeStateChanged extends AuthState {}




