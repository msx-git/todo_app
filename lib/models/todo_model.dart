import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum TodoState {
  active,
  completed,
}

Uuid uuid = const Uuid();

class Todo extends Equatable {
  final String id;
  final String title;
  final Color color;
  final bool isCompleted;

  Todo({
    String? id,
    required this.title,
    required this.color,
    this.isCompleted = false,
  }) : id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, title, isCompleted];

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, completed: $isCompleted}';
  }
}