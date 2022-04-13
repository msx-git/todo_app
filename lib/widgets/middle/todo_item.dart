import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(18),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: todo.color,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                todo.title,
                softWrap: true,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              color: Color(0xFF6FB88D),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: const Icon(
              Icons.done,
              size: 40,
              color: Color(0xFFfffdfd),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFeeeeee),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
