import 'package:bloc_networking/bloc/user_bloc.dart';
import 'package:bloc_networking/widgets/action_button.dart';
import 'package:bloc_networking/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleBlocNetworking extends StatelessWidget {
  const ExampleBlocNetworking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: const Text('BLoC with network connection'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: _buildBody(context),
        ),
      );

  Widget _buildBody(BuildContext context) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          _buildButton(context),
          const SizedBox(height: 10),
          _buildUserList(),
        ],
      );

  Widget _buildButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ActionButton(
          text: "load",
          color: const Color(0xff73A9AD),
          onChange: () {
            context.read<UserBloc>().add(UserLoadEvent());
          },
        ),
        ActionButton(
          text: "Clear",
          color: const Color(0xff898AA6),
          onChange: () {
            context.read<UserBloc>().add(UserClearEvent());
          },
        ),
      ],
    );
  }

  Widget _buildUserList() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return const Center(child: Text('empty', style: TextStyle(fontSize: 20),));
      }
      if (state is UserLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is UserLoadedState) {
        return Expanded(child: UserList(userList: state.loadedUser,));
      }
      return const SizedBox();
    });
  }
}
