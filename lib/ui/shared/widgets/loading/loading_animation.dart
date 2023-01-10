import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rick_and_morty/ui/shared/styles/app_colors.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  State<LoadingAnimation> createState() => _LoadingAnimation();
}

class _LoadingAnimation extends State<LoadingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: LoadingAnimationWidget.discreteCircle(
          color: AppColors.green,
          secondRingColor: AppColors.yellow,
          thirdRingColor: AppColors.yellow,
          size: 45,
        ),
      ),
    );
  }
}
