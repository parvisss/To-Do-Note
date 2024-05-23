import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:to_do_note/controllers/note_controllers.dart';
// import 'package:to_do_note/utils/extensions/extension.dart';
import 'package:to_do_note/views/widgets/edit_item.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

final NoteControllers noteControllers = NoteControllers();
final titleController = TextEditingController();
final textController = TextEditingController();

final titalcontrollerAdd = TextEditingController();
final textcontrollerAdd = TextEditingController();
final noteController = TextEditingController();

int complitedCount = 3;

class _ToDoScreenState extends State<ToDoScreen> {
  // final notecontrller = NoteControllers();
  @override
  Widget build(BuildContext context) {
    print(noteControllers.list[0].date);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 35, 33, 33),
        title: const Text(
          "To Do",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "you complited  $complitedCount ${complitedCount <= 1 ? "task" : "tasks"}",
              style: const TextStyle(color: Colors.white),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: noteControllers.list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: ListTile(
                      trailing: IconButton(
                        onPressed: () {
                          noteControllers.list[index].iscomplited
                              ? complitedCount--
                              : complitedCount++;
                          noteControllers.list[index].iscomplited =
                              !noteControllers.list[index].iscomplited;
                          setState(() {});
                        },
                        icon: Icon(noteControllers.list[index].iscomplited
                            ? Icons.check_box
                            : Icons.check_box_outline_blank_outlined),
                        color: Colors.white,
                      ),
                      title: Text(
                        noteControllers.list[index].title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      subtitle: Text(
                        "${noteControllers.list[index].date}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      PopupMenuButton<int>(
                                        iconColor: Colors.white,
                                        color: Colors.black,
                                        onSelected: (int result) {
                                          setState(
                                            () {
                                              result == 0
                                                  ? showDialog(
                                                      context: context,
                                                      builder: (ctx) {
                                                        return AlertDialog(
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                "Cancel",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                setState(
                                                                  () {
                                                                    noteControllers.edit(
                                                                        index:
                                                                            index,
                                                                        title: titleController
                                                                            .text,
                                                                        text: noteController
                                                                            .text);

                                                                    Navigator.pop(
                                                                        context);
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                );
                                                              },
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .black,
                                                                foregroundColor:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                              child: const Text(
                                                                  "Save"),
                                                            ),
                                                          ],
                                                          backgroundColor:
                                                              const Color
                                                                  .fromARGB(255,
                                                                  35, 33, 33),
                                                          content: Form(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                TextFormField(
                                                                  controller:
                                                                      titleController,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  cursorColor:
                                                                      Colors
                                                                          .white,
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                  decoration:
                                                                      const InputDecoration(
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.white)),
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    labelText:
                                                                        "Title",
                                                                    labelStyle:
                                                                        TextStyle(
                                                                            color:
                                                                                Colors.grey),
                                                                  ),
                                                                ),
                                                                const Gap(20),
                                                                TextFormField(
                                                                  maxLines: 3,
                                                                  cursorColor:
                                                                      Colors
                                                                          .white,
                                                                  controller:
                                                                      noteController,
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  decoration:
                                                                      const InputDecoration(
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Colors.white)),
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(),
                                                                    ),
                                                                    labelText:
                                                                        "Note",
                                                                    labelStyle:
                                                                        TextStyle(
                                                                            color:
                                                                                Colors.grey),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    )
                                                  : showDialog(
                                                      context: context,
                                                      builder: (ctx) {
                                                        return AlertDialog(
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                "Cancel",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                setState(
                                                                  () {
                                                                    noteControllers
                                                                        .delete(
                                                                            index);
                                                                  },
                                                                );
                                                                Navigator.pop(
                                                                    context);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .black,
                                                                foregroundColor:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                              child: const Text(
                                                                  "Remove"),
                                                            ),
                                                          ],
                                                          backgroundColor:
                                                              const Color
                                                                  .fromARGB(255,
                                                                  35, 33, 33),
                                                          content: const Icon(
                                                            CupertinoIcons
                                                                .exclamationmark_octagon,
                                                            size: 100,
                                                          ),
                                                        );
                                                      },
                                                    );
                                            },
                                          );
                                        },
                                        itemBuilder: (ctx) =>
                                            <PopupMenuEntry<int>>[
                                          const PopupMenuItem<int>(
                                            value: 0,
                                            child: Text(
                                              "Edit",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const PopupMenuItem(
                                            value: 1,
                                            child: Text(
                                              "Remove",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 35, 33, 33),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    height: 250.h,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(40.0),
                                      child: SizedBox(
                                          child: Text(
                                        noteControllers.list[index].text,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                    ),
                                  ),
                                ],
                              );
                            });
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          setState(
            () {
              showDialog(
                  context: context,
                  builder: (ctx) {
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
                              controller: titalcontrollerAdd,
                              textInputAction: TextInputAction.next,
                              cursorColor: Colors.white,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
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
                              controller: textcontrollerAdd,
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
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
                            setState(
                              () {
                                noteControllers.add(titalcontrollerAdd.text,
                                    textcontrollerAdd.text);
                              },
                            );
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("Add"),
                        ),
                      ],
                    );
                  });
            },
          );
        },
        icon: const Icon(
          Icons.add,
          color: Colors.white,
          size: 45,
        ),
      ),
    );
  }
}
