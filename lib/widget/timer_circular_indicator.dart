import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerCircularIndicator extends StatelessWidget {
  final Widget center;
  final double percent;

  const TimerCircularIndicator(
      {super.key, required this.percent, required this.center});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 90,
      lineWidth: 1.5,
      percent: percent,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.black,
      widgetIndicator: Center(
        child: Container(
          width: 14,
          height: 14,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Transform.rotate(
            angle: radians(-360 * percent).toDouble(),
            child: SvgPicture.asset(
              'assets/icons/timer.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
          ),
        ),
      ),
      animation: true,
      center: center,
    );
  }
}
