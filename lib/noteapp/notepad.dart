import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Notepad extends StatelessWidget {
  Notepad({
    Key? key,
    required this.color,
    required this.notetext,
  }) : super(key: key);

  final Color color;
  final String notetext;
  String date = DateFormat('yyyy-MM-dd kk:mm:ss a').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 80,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              notetext,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              date,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
