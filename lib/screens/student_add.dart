import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Center(
        child: Text("Öğrenci Formu Burada Olacak"),
      ),
    );
  }
}
