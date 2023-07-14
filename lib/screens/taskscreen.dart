// ignore_for_file: prefer_const_constructors, sort_child_properties_last


import 'package:flutter/material.dart';

import '../widgetsFolder/taskList.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 35, left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      size: 40,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Text(
                    '12 tasks',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: TaskList(),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                margin: EdgeInsets.only(top: 20),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  builder: (context) {
                    return AddTask();
                  });
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}



class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
          children: [
            Text(
              'Add Task',
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple),
            ),
                        SizedBox(height: 10,),

            TextField(
              autofocus: true,
              decoration: InputDecoration(),
            ),
                                    SizedBox(height: 10,),

            TextButton(
          
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                  color: Colors.deepPurple,
      
                    borderRadius: BorderRadius.circular(10)
                  ),
                  alignment: Alignment.center,
                  child: Text('Add',style: TextStyle(color: Colors.white),),
                  height: 60,
                ))
          ],
        ),
      ),
    );
  }
}

class TaskListTile extends StatelessWidget {
  final List list;
  final int index;
  final ValueChanged<bool?> checkBoxCallBack;


   TaskListTile({ required this.list, required this.index, required this.checkBoxCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Checkbox(

    activeColor: Colors.white,
    fillColor: MaterialStateProperty.all(
      Colors.deepPurple,
    ),
    checkColor: Colors.white,
    onChanged: checkBoxCallBack, 
    value: true,
    ),
      title: Text(
        list[index].name,
        style: TextStyle(fontWeight: FontWeight.w600,decoration:true ? TextDecoration.lineThrough:null),
      ),
    );
  }
}


