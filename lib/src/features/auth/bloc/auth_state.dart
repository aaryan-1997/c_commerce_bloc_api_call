// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

abstract class AuthActionState extends AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthActionState {}

class AuthSuccessState extends AuthActionState {
  final String message;
  AuthSuccessState({required this.message});
}

class AuthErrorState extends AuthActionState {}
