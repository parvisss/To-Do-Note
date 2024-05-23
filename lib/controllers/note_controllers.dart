import 'package:to_do_note/models/note.dart';
import 'package:to_do_note/utils/extensions/extension.dart';
// import 'package:to_do_note/views/widgets/edit_item.dart';

class NoteControllers {
  final List<Note> _list = [
    Note(
        title: "darslar",
        text: "17:00 duahnba shanba",
        iscomplited: false,
        date: "2024-04-22 13:55"),
    Note(
        title: "darslar1",
        text: "17:00 duahnba shanba",
        iscomplited: true,
        date: "2024-04-22 13:55"),
    Note(
        title: "darslar2",
        text: "17:00 duahnba shanba",
        iscomplited: false,
        date: "2024-04-22 13:55"),
    Note(
        title: "darslar3",
        text: "17:00 duahnba shanba",
        iscomplited: true,
        date: "2024-04-22 13:55"),
    Note(
        title: "darslar4",
        text: "17:00 duahnba shanba",
        iscomplited: false,
        date: "2024-04-22 13:55"),
    Note(
        title: "darslar5",
        text: "17:00 duahnba shanba",
        iscomplited: true,
        date: "2024-04-22 13:55"),
  ];

  List<Note> get list {
    return [..._list];
  }
  
  void add(String title, String text) {
    _list.add(
      Note(
        title: title,
        text: text,
        iscomplited: false,
        date: DateTime.now().dateTimeFormat(),
      ),
    );
  }

  void edit({
    required int index,
    required String title,
    required String text,
  }) {
    _list[index].text = text;
    _list[index].title = title;
    
  }

  void delete(int index) {
    _list.removeAt(index);
  }
}
