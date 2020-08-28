import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/util/dbhelper.dart';

DbHelper helper = DbHelper();
final List<String> choices = const <String>[
  'Save Todo & Back',
  'Delete Todo',
  'Back to List'
];
const mnuSave = 'Save Todo & Back';
const mnuDelete = 'Delete Todo';
const mnuBack = 'Back to List';

class TodoDetail extends StatefulWidget {
  final Todo todo;

  TodoDetail(this.todo);

  @override
  _TodoDetailState createState() => _TodoDetailState(todo);
}

class _TodoDetailState extends State<TodoDetail> {
  Todo todo;
  _TodoDetailState(this.todo);
  final _priorities = ["High", "Medium", "Low"];
  String _priority = "Low";
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void save() {
      todo.date = new DateFormat.yMd().format(DateTime.now());
      if (todo.id != null) {
        helper.updateTodo(todo);
      } else {
        helper.insertTodo(todo);
      }
    }

    void updatePriority(String value) {
      switch (value) {
        case "High":
          todo.priority = 1;
          break;
        case "Medium":
          todo.priority = 2;
          break;
        case "Low":
          todo.priority = 3;
          break;
      }
      setState(() {
        _priority = value;
      });
    }

    String retrievePriority(int value) {
      return _priorities[value - 1];
    }

    void updateTitle() {
      todo.title = titleController.text;
    }

    void updateDescription() {
      todo.description = descriptionController.text;
    }

    void select(String value) async {
      int result;
      switch (value) {
        case mnuSave:
          save();
          break;
        case mnuDelete:
          // get back to the previous screen
          Navigator.pop(context, true);
          if (todo.id == null) {
            return;
          }
          result = await helper.deleteTodo(todo.id);
          if (result != 0) {
            AlertDialog alert = AlertDialog(
              title: Text("Delete Todo"),
              content: Text("The Todo has been deleted"),
            );
            showDialog(
              context: context,
              builder: (_) => alert,
            );
          }
          break;
        case mnuBack:
          Navigator.pop(context, true);
          break;
      }
    }

    titleController.text = todo.title;
    descriptionController.text = todo.description;
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        // removes back button
        automaticallyImplyLeading: false,
        title: Text(todo.title),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: select,
            itemBuilder: (BuildContext context) {
              return choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0, left: 10.0, right: 10.0),
        child: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: TextField(
                  controller: titleController,
                  style: textStyle,
                  onChanged: (value) => updateTitle(),
                  decoration: InputDecoration(
                      labelText: "Title",
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: TextField(
                  controller: descriptionController,
                  style: textStyle,
                  decoration: InputDecoration(
                      labelText: "Description",
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: ListTile(
                  title: DropdownButton<String>(
                    items: _priorities.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    style: textStyle,
                    value: retrievePriority(todo.priority),
                    onChanged: (value) => updatePriority(value),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
