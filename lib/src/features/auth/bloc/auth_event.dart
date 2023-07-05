// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginButtonClickEvent extends AuthEvent {
  final String username;
  final String password;
  LoginButtonClickEvent({
    required this.username,
    required this.password,
  });
}
