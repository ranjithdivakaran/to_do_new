import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/components/dialog_box.dart';
import 'package:to_do/components/todolist.dart';
import 'package:to_do/database/databases.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final mybox = Hive.box("mybox");
  Tododatabase db = Tododatabase();

  @override
  void initState() {
    if (mybox.get("TODOLIST") == null) {
      db.createinitialdata();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  final text = TextEditingController();

  void checkbox(bool? val, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updatedatabase();
  }

  void savenewtask() {
    setState(() {
      db.todolist.add([text.text, false]);
      text.clear();
    });
    Navigator.of(context).pop();
    db.updatedatabase();
  }

  void createnewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertBox(
            controller: text,
            onsave: savenewtask,
            oncancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deletetask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updatedatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("TO DO"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewtask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.todolist.length,
          itemBuilder: (context, index) {
            return Todolist(
              taskname: db.todolist[index][0],
              onchanged: (val) => checkbox(val, index),
              taskcompleted: db.todolist[index][1],
              removeitem: (context) => deletetask(index), //change
            );
          }),
    );
  }
}
