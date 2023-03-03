import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('flutter map'),
          centerTitle: true,
          leading: Container(),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.purple[800]!,
                ),
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(size.width, size.height / 15),
                ),
              ),
              onPressed: (() {
                setState(() {
                  count++;
                });
              }),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            AnimationLimiter(
              child: Expanded(
                child: ListView.builder(
                  itemCount: count,
                  shrinkWrap: true,
                  reverse: false,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        delay: const Duration(milliseconds: 800),
                        duration: const Duration(milliseconds: 3000),
                        curve: Curves.fastLinearToSlowEaseIn,
                        verticalOffset: -500,
                        child: Container(
                          height: size.height / 12,
                          width: size.width * 0.8,
                          margin: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 237, 135, 255),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              'item $index',
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontSize: 24),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  count--;
                                });
                              },
                              icon: const Icon(Icons.delete_rounded),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
