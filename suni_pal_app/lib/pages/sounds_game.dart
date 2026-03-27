import 'package:flutter/material.dart';
import 'package:suni_pal_app/pages/songs.dart';

class SoundsGame extends StatefulWidget {
  const SoundsGame({super.key});

  @override
  State<SoundsGame> createState() => _SoundsGameState();
}

class _SoundsGameState extends State<SoundsGame> {
  final List<({String image, String soundKey})> soundOptions = const [
    (image: 'images/banners/xylophone.png', soundKey: 'xylophone'),
    (image: 'images/banners/guitar.png', soundKey: 'guitar'),
    (image: 'images/banners/piano.png', soundKey: 'piano'),
    (image: 'images/banners/violin.png', soundKey: 'violin'),
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
          child: SingleChildScrollView(
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
                              selectedSound: soundOptions[index].soundKey,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(double.infinity, 130),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: ClipRRect( 
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          soundOptions[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                     ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
