import 'package:checklist/components/scaffold_com_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Main",
      ),
      home: ScaffoldComBottomBar(pagina: 0),
    );
  }
}