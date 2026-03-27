import 'package:flutter/material.dart';
import 'package:suni_pal_app/pages/songs.dart';

class SoundsGame extends StatefulWidget {
  const SoundsGame({super.key});

  @override
  State<SoundsGame> createState() => _SoundsGameState();
}

class _SoundsGameState extends State<SoundsGame> {
  final List<String> soundOptions = const [
    '1',
    '2',
    '3',
    '4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sounds'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(soundOptions.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  height: 130,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SongsPage(
                            selectedSound: soundOptions[index],
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(soundOptions[index]),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
