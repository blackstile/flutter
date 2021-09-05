import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'model/Task.dart';

main() => runApp(TaskListApp());

class TaskListApp extends StatefulWidget {
  @override
  _TaskListAppState createState() => _TaskListAppState();
}

class _TaskListAppState extends State<TaskListApp> {
  TextEditingController addController = TextEditingController();
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  List<Task> _todoList = [];
  Task _lastRemoved;
  int _lastIndexRemoved;

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      List list = json.decode(data);
      setState(() {
        _todoList = list.map((t) => Task.fromJson(t)).toList();
      });
    });
  }

  _addTodo() {
    setState(() {
      var task = Task(title: addController.text, ok: false);
      _todoList.add(task);
    });
    _saveData();
    addController.clear();
  }

  Future<Null> _refreshItem() async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _todoList.sort((t1, t2) => t1.compareTo(t2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lista de Tarefas",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Lista de Tarefas",
            style: TextStyle(),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Form(
                      key: _keyForm,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nova Tarefa",
                          labelStyle: TextStyle(color: Colors.blueAccent),
                        ),
                        controller: addController,
                        validator: (value) {
                          print("Value: $value");
                          if (value.isEmpty) {
                            return "Insira a descrição da tarefa.";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_keyForm.currentState.validate()) {
                        _addTodo();
                      }
                    },
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Text("ADD"),
                  ),
                ],
              ),
            ),
            Expanded(
                child: RefreshIndicator(
              onRefresh: _refreshItem,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0),
                itemCount: _todoList.length,
                itemBuilder: createItem,
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget createItem(context, index) {
    return Dismissible(
      key: Key(_todoList.elementAt(index).uuid),
      onDismissed: (direction) {
        setState(() {
          _lastRemoved = _todoList.removeAt(index);
          _lastIndexRemoved = index;
          print("Removido com sucesso: ${_lastRemoved.title}");
          _saveData();
        });
        Scaffold.of(context).removeCurrentSnackBar();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Tarefa ${_lastRemoved.title} removida"),
          action: SnackBarAction(
            label: "Desfazer",
            disabledTextColor: Colors.blue,
            onPressed: () {
              setState(() {
                _todoList.insert(_lastIndexRemoved, _lastRemoved);
              });
            },
          ),
        ));
      },
      background: Container(
        color: Colors.red,
        child: Row(
          children: <Widget>[
            Align(
              alignment: Alignment(-0.9, 0.0),
              child: Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
            ),
            Text(
              "Remover",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      child: CheckboxListTile(
        value: _todoList[index].ok,
        onChanged: (value) {
          print(value);
          setState(() {
            _todoList[index].ok = value;
          });
          _saveData();
        },
        title: Text(_todoList[index].title),
        secondary: CircleAvatar(
          child: Icon(_todoList[index].ok ? Icons.check : Icons.error),
        ),
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/task.json");
  }

  Future<File> _saveData() async {
    print("Todo List: ${_todoList}");
    String data = json.encode(_todoList);
    print("Data: ${data}");
    final File file = await _getFile();

    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final File file = await _getFile();
      return file.readAsString();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
