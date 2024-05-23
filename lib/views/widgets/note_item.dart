import 'package:flutter/material.dart';
// import 'package:to_do_note/utils/extensions/extension.dart';
import 'package:to_do_note/views/screens/todo_screen.dart';

class AlignDialog extends StatefulWidget {
  AlignDialog({super.key});

  @override
  State<AlignDialog> createState() => _AlignDialogState();
}

class _AlignDialogState extends State<AlignDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 35, 33, 33),
      title: const Text(
        "New Note",
        style: TextStyle(color: Colors.white),
      ),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              textInputAction: TextInputAction.next,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                labelText: "Title",
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 3,
              cursorColor: Colors.white,
              controller: textController,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                labelText: "Note",
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.white),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              // DateTime now = DateTime.now();
              noteControllers.add(titleController.text, textController.text);
              Navigator.pop(context);
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          child: const Text("Add"),
        ),
      ],
    );
  }
}
