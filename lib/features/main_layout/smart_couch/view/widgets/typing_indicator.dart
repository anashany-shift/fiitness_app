import 'package:flutter/material.dart';

class JumpingDots extends StatefulWidget {
  const JumpingDots({super.key});

  @override
  _JumpingDotsState createState() => _JumpingDotsState();
}

class _JumpingDotsState extends State<JumpingDots> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  final List<Animation<double>> _animations = [];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(3, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controllers[index].reverse();
          } else if (status == AnimationStatus.dismissed) {
            Future.delayed(const Duration(milliseconds: 150), () {
              if (mounted) _controllers[index].forward();
            });
          }
        });
    });

    for (int i = 0; i < 3; i++) {
      _animations.add(Tween<double>(begin: 0, end: -5).animate(_controllers[i]));
      Future.delayed(Duration(milliseconds: i * 200), () {
        if (mounted) _controllers[i].forward();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              transform: Matrix4.translationValues(0, _animations[index].value, 0),
              child: CircleAvatar(radius: 3, backgroundColor: Colors.white70),
            );
          },
        );
      }),
    );
  }
}