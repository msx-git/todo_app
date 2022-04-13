import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;

  @override
  List<Object> get props => [todos];

  @override
  String toString() {
    return 'TodoListState{todos: $todos}';
  }

  factory TodoListState.initial(){
    return TodoListState(todos: [
      Todo(title: 'test', color: Colors.green),
      Todo(title: 'today', color: Colors.blue),
    ]);
  }

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }

  const TodoListState({
    required this.todos,
  });
}

class TodoListProvider with ChangeNotifier{
  TodoListState _state = TodoListState.initial();
  TodoListState get state => _state;

  Color color = Colors.green;

  void addTodo(String todoDesc, Color color) {
    final newTodo = Todo(title: todoDesc, color: color);
    final newTodos = [..._state.todos, newTodo];
    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }

  void removeTodo(Todo todo){
    final newTodos = _state.todos.where((element) => element.id != todo.id).toList();

    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }

  setColor(Color color){
    this.color = color;
    notifyListeners();
  }
}