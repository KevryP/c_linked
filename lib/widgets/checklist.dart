import 'dart:js_util';

import 'package:c_linked/widgets/checklist_tile.dart';
import 'package:flutter/material.dart';
import 'newTaskDialog.dart';

class CheckList extends StatefulWidget {
  const CheckList({super.key});

  @override
  State<CheckList> createState() => CheckListState();
}

class CheckListState extends State<CheckList> {
  List<CheckboxListTile> tasks = [
    CheckboxListTile(value: false, onChanged: (bool? value) {})
  ];

  List<String> taskDescs = [
    "Task 1",
    "Task 2",
    "Task 3",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [Expanded(child: checklistView())]),
      newTaskButton(),
    ]);
  }

  SizedBox checklistView() {
    return SizedBox(
      height: 430,
      width: 50,
      child: ListView.builder(
        itemCount: taskDescs.length,
        itemBuilder: (BuildContext context, int index) {
          return Tile(
              description: taskDescs[index],
              deleteTask: () => deleteTask(index));
        },
      ),
    );
  }

  ElevatedButton newTaskButton() {
    return ElevatedButton(
      onPressed: () => {
        showDialog(
            context: context,
            builder: (BuildContext context) => Center(
                  child: NewTaskDialog(
                    addTask: addTask,
                  ),
                ))
      },
      child: const Icon(Icons.add),
    );
  }

  addTask(String value) {
    taskDescs.add(value);
    setState(() {});
  }

  deleteTask(int index) {
    taskDescs.removeAt(index);
    setState(() {});
  }
}
