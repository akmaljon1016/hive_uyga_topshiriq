import 'package:flutter/material.dart';
import 'package:hive_uyga_topshiriq/todo.dart';

import 'main.dart';

class AddPage extends StatefulWidget {
  final int? index;

  const AddPage({super.key, this.index});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtContent = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      txtTitle =
          TextEditingController(text: todoBox.getAt(widget.index!)?.title ?? "");
      txtContent =
          TextEditingController(text: todoBox.getAt(widget.index!)?.content ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qo'shish oynasi"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: txtTitle,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Title"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: txtContent,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Content"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              if (widget.index == null) {
                ToDo toDo =
                    ToDo(title: txtTitle.text, content: txtContent.text);
                todoBox.add(toDo);
                Navigator.pop(context);
              } else {
                ToDo toDo =
                    ToDo(title: txtTitle.text, content: txtContent.text);
                todoBox.putAt(widget.index!,toDo);
                Navigator.pop(context);
              }
            },
            child: Text(widget.index == null ? "Saqlash" : "O'zgartirish"),
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
