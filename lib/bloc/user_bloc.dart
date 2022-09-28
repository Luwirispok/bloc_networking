import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_networking/models/user.dart';
import 'package:bloc_networking/services/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.userRepository}) : super(UserEmptyState()) {
    on<UserLoadEvent>(_onUserLoadEvent);
    on<UserClearEvent>(_onUserClearEvent);
  }

  final UserRepository userRepository;

  FutureOr<void> _onUserLoadEvent(UserLoadEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());

    try {
      final List<User> loadedUserList = await userRepository.getAllUsers();
      emit(UserLoadedState(loadedUser: loadedUserList));
    } catch (_) {
      emit(UserErrorState());
    }
  }

  FutureOr<void> _onUserClearEvent(UserClearEvent event, Emitter<UserState> emit) {
    emit(UserEmptyState());
  }
}
