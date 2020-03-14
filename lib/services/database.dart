import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/models/user.dart';
import 'package:todoapp/shared/todo_card.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid, });

  // collection reference
  final CollectionReference todoCollection = Firestore.instance.collection('todo');

  Future updateUserData(String todo) async {
    return await todoCollection.document(uid).setData({
      'To Do': todo,
    });
  }

  List<String> _todoListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      print(doc.data);
      return doc.data.toString();
    }).toList();
  }

  // get to-do stream
  Stream<QuerySnapshot> get todo {
    return todoCollection.snapshots();
  }

  Stream<List<String>> get todos {
    return todoCollection.snapshots().map(_todoListFromSnapshot);
  }

}