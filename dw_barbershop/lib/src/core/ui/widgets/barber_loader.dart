import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BarberLoader extends StatelessWidget {
  const BarberLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        color: Colors.brown,
        size: 60,
      ),
    );
  }
}
