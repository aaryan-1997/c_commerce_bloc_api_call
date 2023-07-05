part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeProductFetchEvent extends HomeEvent {}

class HomeCategoryFetchEvent extends HomeEvent {}
