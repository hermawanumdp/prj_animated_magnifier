import 'package:flutter/material.dart';

class AnimatedMagnifier extends StatefulWidget {
  const AnimatedMagnifier({super.key});

  @override
  State<AnimatedMagnifier> createState() => _AnimatedMagnifierState();
}

class _AnimatedMagnifierState extends State<AnimatedMagnifier>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: child,
        );
      },
      child: Image.asset('assets/magnifier.png'),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween(begin: 1.0, end: 0.8).animate(_controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
