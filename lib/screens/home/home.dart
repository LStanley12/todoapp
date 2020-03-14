import 'package:flutter/material.dart';
import 'package:todoapp/services/auth.dart';
import 'package:todoapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/screens/home/todoList.dart';
import 'package:todoapp/shared/constants.dart';
import 'package:todoapp/shared/loading.dart';
import 'package:todoapp/shared/todo_card.dart';

class Home extends StatelessWidget {

  String newTodo = '';
  final AuthService _auth = AuthService();
  final DatabaseService _data = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().todo,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('To Do:'),
          backgroundColor: Colors.green[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('log out'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body:
          Column(
            children: <Widget>[
              SizedBox(height: 5.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'New Task (press "+" to add)'),
                onChanged: (val) {
                    newTodo = val;
                  },
              ),
                ToDoList(),
            ],
          ),

        floatingActionButton: new FloatingActionButton(
        onPressed: () async {
            dynamic result = await _data.updateUserData(newTodo);
        },
          backgroundColor: Colors.green[400],
          focusColor: Colors.green[600],
          tooltip: 'New ToDo',
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}
