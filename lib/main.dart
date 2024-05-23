import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_note/views/screens/todo_screen.dart';

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(100, 300),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ToDoScreen(),
      ),
    );
  }
}

void main(List<String> args) {
  runApp(ToDo());
}
