import 'package:flutter/material.dart';

class ListViewSeparatedScreen extends StatefulWidget {
  @override
  State<ListViewSeparatedScreen> createState() =>
      _ListViewSeparatedScreenState();
}

class _ListViewSeparatedScreenState extends State<ListViewSeparatedScreen> {
  List<String> items = ['Усиленный подкрылок', 'Универсальный подкрылок'];
  final TextEditingController controller = TextEditingController();

  void _addItem() {
    if (controller.text.isNotEmpty) {
      setState(() => items.add(controller.text));
      controller.clear();
    }
  }

  void _removeItem(int index) {
    setState(() => items.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView.separated')),
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
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  key: ValueKey(items[index]),
                  title: Text(items[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeItem(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
