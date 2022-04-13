import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/todo_list_provider.dart';
import '/widgets/bottom/round_color_button.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({Key? key}) : super(key: key);

  @override
  State<CreateTodo> createState() => _CreateTodo();
}

class _CreateTodo extends State<CreateTodo> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submitTodo(String? todoTitle, Color color) {
    if (todoTitle != null && todoTitle.trim().isNotEmpty) {
      context.read<TodoListProvider>().addTodo(todoTitle, color);
      controller.clear();
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  Widget colorChosen(Color color) {
    if (color == context.watch<TodoListProvider>().color) {
      return const Icon(
        Icons.done_rounded,
        color: Colors.white,
      );
    } else if (color == context.watch<TodoListProvider>().color) {
      return const Icon(
        Icons.done_rounded,
        color: Colors.white,
      );
    } else if (color == context.watch<TodoListProvider>().color) {
      return const Icon(
        Icons.done_rounded,
        color: Colors.white,
      );
    } else if (color == context.watch<TodoListProvider>().color) {
      return const Icon(
        Icons.done_rounded,
        color: Colors.white,
      );
    } else if (color == context.read<TodoListProvider>().color) {
      return const Icon(
        Icons.done_rounded,
        color: Colors.white,
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundColorButton(
                color: Colors.green, child: colorChosen(Colors.green)),
            RoundColorButton(color: Colors.red, child: colorChosen(Colors.red)),
            RoundColorButton(
                color: Colors.yellow, child: colorChosen(Colors.yellow)),
            RoundColorButton(
                color: Colors.blue, child: colorChosen(Colors.blue)),
            RoundColorButton(
                color: Colors.orange, child: colorChosen(Colors.orange)),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(12),
          child: TextField(
            controller: controller,
            onSubmitted: (String? todoTitle) =>
                submitTodo(todoTitle, context.read<TodoListProvider>().color),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.blue),
                  borderRadius: BorderRadius.circular(15)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.blue),
                  borderRadius: BorderRadius.circular(15)),
              contentPadding: const EdgeInsets.only(left: 8),
              suffixIcon: InkWell(
                onTap: () => submitTodo(
                    controller.text, context.read<TodoListProvider>().color),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
