import 'package:flutter/material.dart';

class DotsGame extends StatefulWidget {
  const DotsGame({super.key});

  @override
  State<DotsGame> createState() => _DotsGameState();
}

class _DotsGameState extends State<DotsGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dots'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            
          ),
        ),
      ),  
    );
  }
}