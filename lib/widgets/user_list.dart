import 'package:bloc_networking/models/user.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({
    Key? key,
    required this.userList,
  }) : super(key: key);

  final List<User> userList;

  @override
  Widget build(BuildContext context) => ListView.separated(
    padding: EdgeInsets.all(10),
        itemCount: userList.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              color: index % 2 == 0 ? const Color(0xffD6EFED) : const Color(0xffB7D3DF),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff354259).withOpacity(0.23),
                  offset: const Offset(2, 5),
                  blurRadius: 2.0,
                  spreadRadius: 0,
                ), //BoxShadow
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ]),
          child: ListTile(
            leading: Text(
              'ID: ${userList[index].id}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  userList[index].name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                Text('email: ${userList[index].email}'),
                Text('phone: ${userList[index].phone}'),
              ],
            ),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
      );
}
