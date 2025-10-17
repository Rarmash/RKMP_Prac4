import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<String> items = ['Левый подкрылок', 'Правый подкрылок'];
  final TextEditingController controller = TextEditingController();

  void _addItem() {
    if (controller.text.isNotEmpty) {
      setState(() => items.add(controller.text));
      controller.clear();
    }
  }

  void _removeItem(String item) {
    setState(() => items.remove(item));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration:
                    InputDecoration(labelText: 'Введите название'),
                  ),
                ),
                IconButton(onPressed: _addItem, icon: Icon(Icons.add)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                for (var item in items)
                  ListTile(
                    key: ValueKey(item),
                    title: Text(item),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeItem(item),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
