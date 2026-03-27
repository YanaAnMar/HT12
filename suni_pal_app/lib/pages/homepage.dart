import 'package:flutter/material.dart';
import 'package:suni_pal_app/pages/dots_game.dart';
import 'package:suni_pal_app/pages/puzzle_game.dart';
import 'package:suni_pal_app/pages/sorting_game.dart';
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
        title: Text("SuniPal"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(60),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(60),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SoundsGame()),
                        );
                      },
                      child: SizedBox(
                        height: 185,
                        child: Image.asset(
                          'images/banners/sounds.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Material(
                    borderRadius: BorderRadius.circular(60),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(60),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DotsGame()),
                        );
                      },
                      child: SizedBox(
                        height: 185,
                        child: Image.asset(
                          'images/banners/dots.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Material(
                    borderRadius: BorderRadius.circular(60),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(60),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PuzzleGame()),
                        );
                      },
                      child: SizedBox(
                        height: 185,
                        child: Image.asset(
                          'images/banners/puzzle.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Material(
                    borderRadius: BorderRadius.circular(60),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(60),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SortingGame()),
                        );
                      },
                      child: SizedBox(
                        height: 185,
                        child: Image.asset(
                          'images/banners/sorter.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}