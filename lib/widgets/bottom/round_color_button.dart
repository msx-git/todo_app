import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_list_provider.dart';

class RoundColorButton extends StatelessWidget {
  final Color color;
  final Widget child;

  const RoundColorButton({required this.child, required this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TodoListProvider>().setColor(color);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
