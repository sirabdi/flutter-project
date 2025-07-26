import 'package:flutter/material.dart';
import 'package:flutter_rpg/service/character_store.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:provider/provider.dart';

// firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (context) => CharacterStore(),
      child: MaterialApp(theme: primaryTheme, home: const Home()),
    ),
  );
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
