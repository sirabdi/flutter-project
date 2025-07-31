import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum Priority {
  urgent(color: Colors.red, title: 'Urgent'),
  high(color: Colors.orange, title: 'High'),
  medium(color: Colors.amber, title: 'Medium'),
  low(color: Colors.green, title: 'Low');

  const Priority({required this.color, required this.title});

  final Color color;
  final String title;
}

class Todo {
  const Todo({
    required this.id,
    required this.title,
    required this.description,
    // required this.priority,
  });

  final String id;
  final String title;
  final String description;
  // final Priority priority;

  Map<String, dynamic> toFirestore() {
    return {'title': title, 'description': description};
  }

  factory Todo.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    // get data from snapshot
    final data = snapshot.data()!;

    // create character from data
    Todo todo = Todo(
      title: data['title'] as String,
      description: data['description'] as String,
      id: snapshot.id,
    );

    return todo;
  }
}

List<Todo> todos = [];
