import 'package:flutter/material.dart';
import 'widgets/profile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black38,
        body: Center(
          child: Profile(),
        ),
      ),
    );
  }
}
