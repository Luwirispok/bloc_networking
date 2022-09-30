part of 'user_bloc.dart';

abstract class UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  UserLoadedState({required this.loadedUser});

  List<User> loadedUser;
}

class UserErrorState extends UserState {}
