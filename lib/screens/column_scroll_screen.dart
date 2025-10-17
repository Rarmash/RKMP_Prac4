import 'package:flutter/material.dart';

class ColumnScrollScreen extends StatefulWidget {
  const ColumnScrollScreen({super.key});

  @override
  State<ColumnScrollScreen> createState() => _ColumnScrollScreenState();
}

class _ColumnScrollScreenState extends State<ColumnScrollScreen> {
  List<String> items = ['Передний подкрылок', 'Задний подкрылок'];
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
      appBar: AppBar(title: Text('Column + Scroll')),
      body: SingleChildScrollView(
        child: Column(
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
            for (var item in items)
              ListTile(
                title: Text(item),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _removeItem(item),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
