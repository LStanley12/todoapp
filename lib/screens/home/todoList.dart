import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/shared/todo_card.dart';
import 'package:todoapp/models/user.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  @override
  Widget build(BuildContext context) {

    final todo = Provider.of<List<String>>(context) ?? [];

    return ListView.builder(
      itemBuilder: (context, index){
        return TodoCard(item: todo[index]);
      },
    );
  }
}
