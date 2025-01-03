import 'package:flutter/material.dart';
import 'package:mobile/main.dart';

void main() {
  runApp(Entry());
}

class Entry extends StatelessWidget {
  const Entry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnlyStudy',
      theme: ThemeData(
        primaryColor: Color(0xFF93B5CF),
      ),
      home: Index(),
    );
  }
}
