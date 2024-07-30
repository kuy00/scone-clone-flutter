import 'package:flutter/material.dart';
import 'package:flutter_study/util/datetime_util.dart';
import 'package:flutter_study/widget/timer_widget.dart';
import 'package:jiffy/jiffy.dart';

class CircularInnerRemainingTime extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  const CircularInnerRemainingTime(
      {super.key, required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    // 00시로 입력되어 남은 날짜 계산 시 +1을 해줌
    DateTime nextDayStartDate = dateAdd(startDate, days: 1);
    DateTime nextDayEndDate = dateAdd(endDate, days: 1);
    int remainDate = dateDiff(DateTime.now(), nextDayEndDate, unit: Unit.day);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '남은 시간',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            remainDate <= 0
                ? isToday(endDate)
                    ? TimerWidget(
                        endDate: nextDayEndDate,
                      )
                    : const Text(
                        '완료',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      )
                : isAfter(startDate, DateTime.now())
                    ? Text(
                        '시작 ${dateDiff(DateTime.now(), nextDayStartDate, unit: Unit.day)}일 전',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        '${remainDate + 1}일',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '/ ${dateDiff(startDate, endDate, unit: Unit.day) + 1}일',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
