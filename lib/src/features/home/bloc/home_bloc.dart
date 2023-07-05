import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_commerce_bloc_api_call/src/features/home/models/product.dart';
import 'package:c_commerce_bloc_api_call/src/repository/home_repo.dart';
import 'package:c_commerce_bloc_api_call/src/services/handling_exception.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductFetchEvent>(homeProductFetchEvent);
    on<HomeCategoryFetchEvent>(homeCategoryFetchEvent);
  }

  FutureOr<void> homeProductFetchEvent(
      HomeProductFetchEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await HomeRepo().fetchProduct().then((response) {
      if (HandlingException.checkStatusCode(response)) {
        var result = productFromJson(response.body);
        emit(HomeProductSuccessState(prductList: result));
      } else {
        emit(HomeErrorState());
      }
    });
  }

  FutureOr<void> homeCategoryFetchEvent(
      HomeCategoryFetchEvent event, Emitter<HomeState> emit) async {
    await HomeRepo().fetchCategory().then((response) {
      if (HandlingException.checkStatusCode(response)) {
        var result = categoryFromJson(response.body);
        emit(HomeCategorySuccessState(categoryList: result));
      } else {
        emit(HomeErrorState());
      }
    });
  }
}
