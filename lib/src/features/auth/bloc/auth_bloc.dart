import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:c_commerce_bloc_api_call/src/services/handling_exception.dart';
import 'package:c_commerce_bloc_api_call/src/util/local_database.dart';
import 'package:flutter/material.dart';

import '../../../repository/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginButtonClickEvent>(loginButtonClickEvent);
  }

  FutureOr<void> loginButtonClickEvent(
      LoginButtonClickEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    await AuthRepo().login(event.username, event.password).then((response) {
      log(response.body);
      if (HandlingException.checkStatusCode(response)) {
        LocalDatabase().setToken(response.body);
        emit(AuthSuccessState(message: response.body));
      } else {
        emit(AuthErrorState());
      }
    });
  }
}
