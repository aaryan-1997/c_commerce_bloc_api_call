// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeProductSuccessState extends HomeState {
  final List<Product> prductList;
  HomeProductSuccessState({
    required this.prductList,
  });
}
class HomeCategorySuccessState extends HomeState {
  final List<String> categoryList;
  HomeCategorySuccessState({
    required this.categoryList,
  });
}

class HomeErrorState extends HomeState {}
