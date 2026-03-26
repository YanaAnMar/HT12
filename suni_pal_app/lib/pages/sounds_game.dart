import 'dart:math';
import 'package:flutter/material.dart';

class SoundsGame extends StatefulWidget {
  const SoundsGame({super.key});

  @override
  State<SoundsGame> createState() => _SoundsGameState();
}

class _SoundsGameState extends State<SoundsGame>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18)
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 241, 188),
      appBar: AppBar(
        title: const Text('Sounds'),
        backgroundColor: Colors.white,
      ),
      body: Align(
        alignment: const Alignment(0, -0.35),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              size: const Size(420, 420),
              painter: CirclePainter(_controller.value),
            );
          },
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double value;

  CirclePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);

    final pulse = 1 + (0.05 * sin(value * 2 * pi));

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.scale(pulse);

    final outerPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 65, 62, 221),
          Color.fromARGB(255, 16, 122, 172),
        ],
      ).createShader(Rect.fromCircle(center: Offset.zero, radius: 150))
      ..style = PaintingStyle.fill;

    final middlePaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(220, 139, 146, 204),
          Color.fromARGB(220, 141, 153, 234),
        ],
      ).createShader(Rect.fromCircle(center: Offset.zero, radius: 105))
      ..style = PaintingStyle.fill;

    final innerPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 156, 215, 236),
          Color.fromARGB(255, 166, 212, 228),
        ],
      ).createShader(Rect.fromCircle(center: Offset.zero, radius: 70))
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.rotate(value * 5 * pi);
    canvas.drawCircle(Offset.zero, 130, outerPaint);
    canvas.restore();

    canvas.save();
    canvas.rotate(-value * 7 * pi);
    canvas.drawCircle(Offset.zero, 92, middlePaint);
    canvas.restore();

    canvas.save();
    canvas.rotate(value * 9 * pi);
    canvas.drawCircle(Offset.zero, 58, innerPaint);
    canvas.restore();

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
