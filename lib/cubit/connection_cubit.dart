import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connection_state.dart';

class ConnectionCubit extends Cubit<MyConnectionState> {
  ConnectionCubit() : super(MyConnectionState()) {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      emit(MyConnectionState(connected: result != ConnectivityResult.none));
    });
  }

  late StreamSubscription<ConnectivityResult> _subscription;

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
