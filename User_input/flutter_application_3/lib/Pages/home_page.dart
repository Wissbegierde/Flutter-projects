import 'package:flutter/material.dart';
import 'package:flutter_application_3/util/dialog_box.dart';
import 'package:flutter_application_3/util/todo_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  //final _myBox = Hive.box('mybox');
  //TodoDatabase db= TodoDatabase();
  
  List toDolist = [
      ["Make Tutorial", false],
      ["Do Exercise", false]
    ];

  // @override
  // void initState() {
  //   // if this is the first time the app is run, then create default data
  //   if(_myBox.get("TODOLIST") == null){
  //     db.createInitialData();
      
  //   } else{
  //     db.loadData();
  //   }
  //   super.initState();
  // }


  //checkbox changed
  void checkBoxChanged(bool? value, int index) {
    setState(() {
    toDolist[index][1] = value!;
    });
   // db.updateDataBase();
  }

  //text controller
  final _controller = TextEditingController();

  //save new task
  void saveNewTask(){
    setState(() {
      toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    //db.updateDataBase();
  }

  //create new task
  void createNewTask(){
    showDialog(
      context: context,
      builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
  void deleteTask(int index){
    setState(() {
      toDolist.removeAt(index);
    });
    //db.updateDataBase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('To Do'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDolist.length,
        itemBuilder: (context, index ){
          return TodoTile(taskName: toDolist[index][0], 
          taskCompleted: toDolist[index][1], 
          onChanged: (value) => checkBoxChanged(value, index),
          deleteFunction: (context) => deleteTask(index),
          );
        },
      )
    );
  }
}