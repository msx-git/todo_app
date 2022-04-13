import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.all(10),
        middle: Text(
          'Qaydnoma',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFf2c94c),
      ),
      body: Column(
        children: [
          Expanded(
            child: TodoListWidget(),
          ),
          const SizedBox(height: 12),
          const CreateTodo(),
        ],
      ),
    );
  }
}
