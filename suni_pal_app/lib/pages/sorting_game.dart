import 'dart:math';
import 'package:flutter/material.dart';

class SortingGame extends StatefulWidget {
  const SortingGame({super.key});
  @override
  State<SortingGame> createState() => _SortingGameState();
}

class _SortingGameState extends State<SortingGame> {
  static const int _count = 5;
  late List<double> _sizes;
  late List<Color> _colors;
  bool _won = false;

  final _rng = Random();
  final _palette = [Colors.red, Colors.blue, Colors.amber, Colors.green, Colors.purple];

  @override
  void initState() {
    super.initState();
    _newRound();
  }

  void _newRound() {
    // Generate sorted sizes, then shuffle them
    _sizes = List.generate(_count, (i) => 40.0 + i * 25);
    _colors = List.generate(_count, (i) => _palette[i % _palette.length]);
    // Shuffle until not already sorted
    do {
      final order = List.generate(_count, (i) => i)..shuffle(_rng);
      final shuffledSizes = [for (final i in order) _sizes[i]];
      final shuffledColors = [for (final i in order) _colors[i]];
      _sizes = shuffledSizes;
      _colors = shuffledColors;
    } while (_isSorted());
    _won = false;
  }

  bool _isSorted() {
    for (int i = 0; i < _sizes.length - 1; i++) {
      if (_sizes[i] > _sizes[i + 1]) return false;
    }
    return true;
  }

  void _swap(int a, int b) {
    setState(() {
      final tmpS = _sizes[a]; _sizes[a] = _sizes[b]; _sizes[b] = tmpS;
      final tmpC = _colors[a]; _colors[a] = _colors[b]; _colors[b] = tmpC;
      if (_isSorted()) _won = true;
    });
  }

  int? _selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 0,
        title: const Text('Sort the Circles', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: () => setState(() { _newRound(); _selected = null; }))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              _won ? 'You did it!' : 'Tap two circles to swap them.\nSmallest on the left, biggest on the right.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: _won ? Colors.green : Colors.black87),
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(_count, (i) {
                  final isSelected = _selected == i;
                  return GestureDetector(
                    onTap: () {
                      if (_won) return;
                      if (_selected == null) {
                        setState(() => _selected = i);
                      } else {
                        if (_selected != i) _swap(_selected!, i);
                        setState(() => _selected = null);
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: _sizes[i],
                      height: _sizes[i],
                      decoration: BoxDecoration(
                        color: _colors[i],
                        shape: BoxShape.circle,
                        border: isSelected ? Border.all(color: Colors.black, width: 3) : null,
                        boxShadow: [BoxShadow(color: _colors[i].withValues(alpha: 0.4), blurRadius: 8)],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          if (_won)
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                onPressed: () => setState(() { _newRound(); _selected = null; }),
                child: const Text('Play Again'),
              ),
            ),
        ],
      ),
    );
  }
}