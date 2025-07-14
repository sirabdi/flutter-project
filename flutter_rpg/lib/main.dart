import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/home.dart';

void main() {
  runApp(const MaterialApp(home: SandBox()));
}

class SandBox extends StatelessWidget {
  const SandBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SandBox Mode'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(16),
        child: const Text('SandBox'),
      ),
    );
  }
}
