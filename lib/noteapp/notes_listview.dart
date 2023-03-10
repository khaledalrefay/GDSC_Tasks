import 'package:flutter/material.dart';
import 'package:gdsc_tasks/noteapp/notepad.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({
    super.key,
  });

  getNote() {}

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  late final Color color;
  late final String notetext;

  getNote(Color color, String text) {
    color = color;
    text = notetext;
  }

  List<Map<String, Object>> note = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: note.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Notepad(
            color: color,
            notetext: notetext,
          ),
        );
      },
    );
  }
}
