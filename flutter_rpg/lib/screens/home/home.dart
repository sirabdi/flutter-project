import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/character/character_screen.dart';
import 'package:flutter_rpg/screens/create/create_screen.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/service/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<CharacterStore>(context, listen: false).fetchCharactersOnce();

    super.initState();
  }

  static final listMenu = [
    {
      'id': '1',
      'title': 'Character Page',
      'subtitle': 'Add Character and edit stats on it',
      'screen': CharacterScreen(),
    },
    {
      'id': '1',
      'title': 'Todo Page',
      'subtitle': 'Add Todos List',
      'screen': CharacterScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledHeading('Main Course'), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listMenu.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(listMenu[index]['id']),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) =>
                                listMenu[index]['screen'] as Widget,
                          ),
                        );
                      },
                      title: StyledTitle(listMenu[index]['title'].toString()),
                      subtitle: StyledText(
                        listMenu[index]['subtitle'].toString(),
                      ),
                      tileColor: AppColors.secondaryColor,
                      trailing: Icon(
                        Icons.arrow_right_alt_outlined,
                        color: AppColors.textColor,
                      ),
                    ),
                  );
                },
              ),
            ),

            // StyledButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (ctx) => const CreateScreen()),
            //     );
            //   },
            //   child: const StyledTitle('Create New'),
            // ),
          ],
        ),
      ),
    );
  }
}
