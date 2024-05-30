import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/utils/datetime_util.dart';
import 'package:flutter_study/view_model/circular_indicator_view_model.dart';
import 'package:flutter_study/widget/home/circular_inner_free_type_info.dart';
import 'package:flutter_study/widget/home/circular_inner_remaining_time.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class FreeTypeCircularIndicator extends StatelessWidget {
  final PlanEntity plan;

  const FreeTypeCircularIndicator({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    final double percent =
        dateDiff(DateTime.now(), plan.endDate, unit: Unit.day).toDouble() /
            dateDiff(plan.startDate, plan.endDate, unit: Unit.day).toDouble();

    return ChangeNotifierProvider(
        create: (_) => CircularIndicatorViewModel(),
        builder: (context, child) {
          return CircularPercentIndicator(
            radius: 90,
            lineWidth:
                context.watch<CircularIndicatorViewModel>().isPressed ? 4 : 1.5,
            backgroundWidth: 1.5,
            percent: percent < 0 || percent.isNaN ? 0 : percent,
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: const Color(0xFFF2F2F2),
            progressColor: Colors.black,
            widgetIndicator: Center(
              child: Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Listener(
                    onPointerDown: (e) => context
                        .read<CircularIndicatorViewModel>()
                        .setIsPressed(true),
                    onPointerUp: (e) => context
                        .read<CircularIndicatorViewModel>()
                        .setIsPressed(false),
                    child: Transform.rotate(
                      angle: percent < 0 || percent.isNaN
                          ? 0
                          : radians(-360 * percent).toDouble(),
                      child: SvgPicture.asset(
                        'assets/icons/timer.svg',
                        colorFilter: const ColorFilter.mode(
                            Colors.black, BlendMode.srcIn),
                      ),
                    ),
                  )),
            ),
            animation: true,
            // TODO : animation 추가
            center: context.watch<CircularIndicatorViewModel>().isPressed
                ? CircularInnerRemainingTime(
                    startDate: plan.startDate, endDate: plan.endDate)
                : CircularInnerFreeTypeInfo(
                    totalConsumption: plan.totalConsumption,
                    totalIncome: plan.totalIncome),
          );
        });
  }
}
