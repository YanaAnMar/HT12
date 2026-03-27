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

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 170,
        leading: Image.asset(
            'images/sunipal_logo.png',
            fit: BoxFit.contain
          ),
        
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight, 
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center( 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                crossAxisAlignment: CrossAxisAlignment.center, 
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
                        height: screenHeight * 0.32, 
                        width: double.infinity,
                        child: Image.asset(
                          'images/banners/sounds.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05), 
                  
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
                        height: screenHeight * 0.32,
                        width: double.infinity,
                        child: Image.asset(
                          'images/banners/dots.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  
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
                        height: screenHeight * 0.32, 
                        width: double.infinity,
                        child: Image.asset(
                          'images/banners/puzzle.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05), 
                  
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
                        height: screenHeight * 0.32, 
                        width: double.infinity,
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
