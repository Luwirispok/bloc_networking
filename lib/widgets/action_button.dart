import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.text,
    required this.onChange,
    this.color = Colors.blueAccent,
  }) : super(key: key);

  final String text;
  final VoidCallback onChange;
  final Color color;

  @override
  Widget build(BuildContext context) => ScaleTap(
        onPressed: onChange,
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            color: color,
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      );
}
