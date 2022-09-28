import 'package:bloc_networking/widgets/action_button.dart';
import 'package:bloc_networking/widgets/user_list.dart';
import 'package:flutter/material.dart';

class ExampleBlocNetworking extends StatelessWidget {
  const ExampleBlocNetworking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('BLoC with network connection'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: _buildBody(),
        ),
      );

  Widget _buildBody() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          _buildButton(),
          const SizedBox(height: 10),
          const Expanded(child: UserList(itemCount: 20)),
        ],
      );

  Widget _buildButton() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ActionButton(
            text: "load",
            color: const Color(0xff73A9AD),
            onChange: () {},
          ),
          ActionButton(
            text: "Clear",
            color: const Color(0xff898AA6),
            onChange: () {},
          ),
        ],
      );
}
