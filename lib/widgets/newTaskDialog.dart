import 'package:flutter/material.dart';

class NewTaskDialog extends StatefulWidget {
  final Function(String) addTask;
  const NewTaskDialog({super.key, required this.addTask});

  @override
  State<NewTaskDialog> createState() => NewTaskDialogState();
}

class NewTaskDialogState extends State<NewTaskDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: newTaskDialog(context),
    );
  }

  AlertDialog newTaskDialog(context) {
    return AlertDialog(
      title: const Text("Create New Task"),
      content: testForm(),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => {
            if (_formKey.currentState!.validate())
              {
                Navigator.pop(context),
              }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }

  Form testForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Task Description",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a task description';
              }
              widget.addTask(value);
              return null;
            },
          ),
        ],
      ),
    );
  }
}
