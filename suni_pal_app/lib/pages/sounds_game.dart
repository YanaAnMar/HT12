import 'package:flutter/material.dart';

class SoundsGame extends StatefulWidget {
  const SoundsGame({super.key});

  @override
  State<SoundsGame> createState() => _SoundsGameState();
}

class _SoundsGameState extends State<SoundsGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sounds'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            
          ),
        ),
      )
        
    );
  }
}