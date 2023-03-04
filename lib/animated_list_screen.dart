import 'package:flutter/material.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  final List<String> items = [];
  final GlobalKey<AnimatedListState> key = GlobalKey();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        leading: Container(),
        elevation: 10,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.purple,
            height: 50,
            width: double.infinity,
            child: TextButton(
              onPressed: insertItem,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          Expanded(
            child: AnimatedList(
              key: key,
              controller: scrollController,
              initialItemCount: items.length,
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: AnimatedListItem(
                    onPressed: () {
                      deleteItem(index);
                    },
                    text: items[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void insertItem() {
    var index = items.length;
    items.add('item ${index + 1}');
    key.currentState!
        .insertItem(index, duration: const Duration(milliseconds: 1000));
    Future.delayed(const Duration(milliseconds: 300), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  void deleteItem(int index) {
    var removeritem = items.removeAt(index);
    key.currentState!.removeItem(index,
        duration: const Duration(milliseconds: 1000), (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: AnimatedListItem(
          text: removeritem,
          onPressed: () {},
        ),
      );
    });
  }
}

class AnimatedListItem extends StatelessWidget {
  const AnimatedListItem(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: ListTile(
        title: Text(text),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
