import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_note/controllers/note_controllers.dart';

class Edit extends StatefulWidget {
  final index;
  Edit({required this.index});

  @override
  State<Edit> createState() => _EditState();
}

NoteControllers noteControllers = NoteControllers();

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}
