import 'package:flutter/material.dart';
import 'package:todoapp/screens/home/todoList.dart';

class TodoCard extends StatelessWidget {

  final String item;
  final Function delete;

  TodoCard({ this.item, this.delete });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              item,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0),
            FlatButton.icon(
              onPressed: delete,
              label: Text('Delete'),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}