import 'package:flutter/material.dart';
import 'screens/column_scroll_screen.dart';
import 'screens/listview_screen.dart';
import 'screens/listview_separated_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'prac4',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> screens = [
    {'title': 'Column + Scroll', 'widget': ColumnScrollScreen()},
    {'title': 'ListView', 'widget': ListViewScreen()},
    {'title': 'ListView.separated', 'widget': ListViewSeparatedScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Каталог подкрылков')),
      body: ListView.builder(
        itemCount: screens.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(screens[index]['title']),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => screens[index]['widget']),
              );
            },
          );
        },
      ),
    );
  }
}
