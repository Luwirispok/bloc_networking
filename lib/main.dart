import 'package:bloc_networking/bloc/user_bloc.dart';
import 'package:bloc_networking/cubit/connection_cubit.dart';
import 'package:bloc_networking/user_screen.dart';
import 'package:bloc_networking/services/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc(userRepository: UserRepository()),
          ),
          BlocProvider(
            create: (context) => ConnectionCubit(),
          ),
        ],
        child: const ExampleBlocNetworking(),
      ),
    );
  }
}
