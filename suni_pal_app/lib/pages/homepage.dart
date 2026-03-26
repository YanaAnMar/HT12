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
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
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
            icon: Icon(Icons.settings),
          ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // SoundsGame
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) {
                        return SoundsGame();
                      },
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Container(
                    height: 220,
                    width: double.infinity,
                    color: Colors.cyan,
                  ),
                ),
              ),
              SizedBox(height: 30.0),

              // DotsGame
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) {
                        return DotsGame();
                      },
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Container(
                    height: 220,
                    width: double.infinity,
                    color: Colors.cyan,
                  ),
                ),
              ),
              SizedBox(height: 30.0),

              // PuzzleGame
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) {
                        return PuzzleGame();
                      },
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Container(
                    height: 220,
                    width: double.infinity,
                    color: Colors.cyan,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}