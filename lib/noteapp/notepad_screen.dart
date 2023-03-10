import 'package:flutter/material.dart';
import 'package:gdsc_tasks/noteapp/notepad.dart';
import 'package:gdsc_tasks/noteapp/notes_listview.dart';
import 'package:gdsc_tasks/noteapp/buttomsheet.dart';

class NotepadScreen extends StatefulWidget {
  const NotepadScreen({super.key});

  @override
  State<NotepadScreen> createState() => _NotepadScreenState();
}

class _NotepadScreenState extends State<NotepadScreen> {
  final TextEditingController searchcontoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Notepad',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                cursorColor: Colors.amber,
                controller: searchcontoller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.amber,
                    ),
                    focusedBorder: OutlineInputBorder(
                      // borderRadius:  borderRadius: BorderRadius.all(
                      //   Radius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.amber,
                        width: 3,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    hintText: 'Search notes',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ),
              const SizedBox(
                height: 30,
              ),
              Notepad(color: Colors.amber, notetext: 'GDSC TASK'),
              Notepad(color: Colors.greenAccent, notetext: 'Note App'),
              const Expanded(child: NotesListView()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.white,
              barrierColor: Colors.amber.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              context: context,
              builder: (context) {
                return const AddNoteButtomSheet();
              },
            );
          },
          backgroundColor: Colors.yellow,
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
