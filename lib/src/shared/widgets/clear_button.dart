import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({
    Key key,
    controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red.shade400,
        ),
        child: Icon(
          Icons.clear,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        _controller.clear();
      },
    );
  }
}
