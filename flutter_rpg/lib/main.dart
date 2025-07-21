import 'package:flutter/material.dart';
// import 'package:flutter_rpg/screens/create/create.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:flutter_rpg/screens/home/home.dart';

void main() {
  runApp(MaterialApp(theme: primaryTheme, home: const Home()));
}

class SandBox extends StatelessWidget {
  const SandBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SandBox Mode'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(16),
        child: const Text('SandBox Pages'),
      ),
    );
  }
}
