import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  final Function()? deleteTask;
  final String description;
  const Tile({super.key, required this.description, required this.deleteTask});

  @override
  State<Tile> createState() => TileState();
}

class TileState extends State<Tile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return tileConstruct();
  }

  Container tileConstruct() {
    return Container(
      height: 50,
      decoration: const BoxDecoration(color: Colors.deepPurple),
      child: Row(
        children: [
          Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              }),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(widget.description),
          ),
          const Spacer(),
          popup(),
        ],
      ),
    );
  }

  PopupMenuButton popup() {
    return PopupMenuButton(itemBuilder: (BuildContext context) {
      return <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'popup_delete',
          child: Column(
            children: [
              TextButton(
                onPressed: handleDelete,
                child: const Text("Delete"),
              ),
            ],
          ),
        )
      ];
    });
  }

  handleDelete() {
    Navigator.pop(context);
    widget.deleteTask!();
  }
}
