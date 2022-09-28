import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({
    Key? key,
    required this.itemCount,
  }) : super(key: key);

  final int itemCount;

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: itemCount,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: index % 2 == 0 ? const Color(0xffD6EFED) : const Color(0xffB7D3DF),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffF8F9D7).withOpacity(0.23),
                  offset: const Offset(5.0, 5.0),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
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
              'ID: $index',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  'My name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Text('email: '),
                Text('phone: '),
              ],
            ),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
      );
}
