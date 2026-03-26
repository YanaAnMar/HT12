import 'package:flutter/material.dart';
import 'package:suni_pal_app/pages/dots_game.dart';
import 'package:suni_pal_app/pages/puzzle_game.dart';
import 'package:suni_pal_app/pages/settings.dart';
import 'package:suni_pal_app/pages/sounds_game.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Homepage"),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) {
                      return Settings();
                    },
                  ),
              );
          },
          icon: Icon(Icons.settings)
        ),
      ],
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            InkWell(
            onTap: (){
              Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) {
                      return SoundsGame();
                    },
                  ),
              );
            },
             child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.cyan,
            ),
            ),
            SizedBox(
              height: 30.0,
            ),
            InkWell(
            onTap: (){
              Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) {
                      return DotsGame();
                    },
                  ),
              );
            },
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.cyan,
            ),
            ),
            SizedBox(
              height: 30.0,
            ),
            InkWell(
            onTap: (){
              Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) {
                      return PuzzleGame();
                    },
                  ),
              );
            },
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.cyan,
            ),
            ),
          ],
        ),
      ),

    ),
  );
  }
}