import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Quiz()),
    ),
  );
}
