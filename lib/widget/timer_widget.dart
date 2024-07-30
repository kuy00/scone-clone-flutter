import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_study/util/datetime_util.dart';
import 'package:jiffy/jiffy.dart';

class TimerWidget extends StatefulWidget {
  final DateTime endDate;

  const TimerWidget({super.key, required this.endDate});

  @override
  State<StatefulWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer timer;
  late int remainSeconds;

  @override
  void initState() {
    super.initState();
    remainSeconds = dateDiff(DateTime.now(), widget.endDate, unit: Unit.second);
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainSeconds == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          remainSeconds--;
        });
      }
    });
  }

  String formatDuration(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatDuration(remainSeconds),
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
