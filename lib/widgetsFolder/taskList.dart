import 'package:flutter/material.dart';
import 'package:todoey/screens/taskscreen.dart';
import 'package:todoey/modal/task.dart';

class TaskList extends StatefulWidget {
   TaskList({
    super.key,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
List<Task> taskList = [
  Task(name: 'connect firebase to project'),
 Task(name: 'watch one piece'),
 Task(name: 'play pubg Moblale'),

]; 

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 30, right: 20, top: 40),
      itemCount: taskList.length,
      itemBuilder: (BuildContext context, int index) {
        return TaskListTile(index: index,list:taskList, checkBoxCallBack: (value) { setState(() {
          taskList[index].isDoneMethod();
        }); },);
      },
    );
  }
}