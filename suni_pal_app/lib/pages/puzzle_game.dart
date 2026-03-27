import 'package:flutter/material.dart';
import 'dart:math';

class PuzzleGame extends StatefulWidget {
  const PuzzleGame({super.key});

  @override
  State<PuzzleGame> createState() => _PuzzleGameState();
}

class _PuzzleGameState extends State<PuzzleGame> {
  static const int gridSize = 3;
  late List<int> tiles;

  @override

  void initState(){
    super.initState();
    initPuzzle();
  }

  void initPuzzle(){
    tiles = List.generate(gridSize * gridSize, (index) => index);
    shuffle();
  }

  void shuffle(){
    final random = Random();

    for (int i = 0; i < 20; i++){
      List<int> movableTiles = [];

      for (int j = 0; j < tiles.length; j++){
        if (canMove(j)) {
          movableTiles.add(j);
        }
      }

      int moveIndex = movableTiles[random.nextInt(movableTiles.length)];
      moveTile(moveIndex, notify: false);
      setState(() {});
    }
  }

  bool canMove(int index){
    int emptyIndex = tiles.indexOf(0);

    int row = index ~/ gridSize;
    int col = index % gridSize;

    int emptyRow = emptyIndex ~/ gridSize;
    int emptyCol = emptyIndex % gridSize;

    return (row == emptyRow && (col - emptyCol).abs() == 1) || (col == emptyCol && (row - emptyRow).abs() == 1);
  }

  void moveTile(int index, {bool notify = true}){
    if (!canMove(index)) return;

    int emptyIndex = tiles.indexOf(0);
    tiles[emptyIndex] = tiles[index];
    tiles[index] = 0;

    if (notify){
      setState(() {});
       if (isSolved()){
        winScreen();
       }
    }
  }

  bool isSolved(){
    for (int i = 0; i < tiles.length -1; i++){
      if (tiles[i] != i + 1){
        return false;
      }
    }
    return tiles.last == 0;
  }

  void winScreen(){
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("You win!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              initPuzzle();
            },
            child: const Text("Play again"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slide puzzle'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: tiles.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridSize,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                  ), 
                  itemBuilder: (context, index) {
                final tile = tiles[index];

                return GestureDetector(
                  onTap: () => moveTile(index),
                  child: tile == 0
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'images/puz1_$tile.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                );
              },
                ),
              ),
            ],
          ),
        ),
      ),
        
    );
  }
}