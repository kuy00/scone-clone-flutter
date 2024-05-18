import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/utils/datetime_util.dart';
import 'package:flutter_study/view_model/circular_indicator_view_model.dart';
import 'package:flutter_study/widget/home/circular_inner_plan_type_info.dart';
import 'package:flutter_study/widget/home/circular_inner_remaining_time.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class PlanTypeCircularIndicator extends StatelessWidget {
  final PlanEntity plan;

  const PlanTypeCircularIndicator({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    final double percent =
        dateDiff(DateTime.now(), plan.endDate, unit: Unit.day).toDouble() /
            dateDiff(plan.startDate, plan.endDate, unit: Unit.day).toDouble();

    return ChangeNotifierProvider(
        create: (_) => CircularIndicatorViewModel(),
        builder: (context, child) {
          return CircularPercentIndicator(
            radius: 100,
            lineWidth:
                context.watch<CircularIndicatorViewModel>().isPressed ? 4 : 1.5,
            percent: percent < 0 ? 0 : percent,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: const Color(0xFFF2F2F2),
            backgroundColor: Colors.transparent,
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
                      angle:
                          percent < 0 ? 0 : radians(-360 * percent).toDouble(),
                      child: SvgPicture.asset(
                        'assets/icons/timer.svg',
                        colorFilter: const ColorFilter.mode(
                            Color(0xFFF2F2F2), BlendMode.srcIn),
                      ),
                    )),
              ),
            ),
            animation: true,
            center: CircularPercentIndicator(
              radius: 90,
              lineWidth: 12,
              percent:
                  plan.remainAmount.toDouble() / plan.totalAmount.toDouble(),
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: const Color(0xFFF2F2F2),
              progressColor:
                  context.watch<CircularIndicatorViewModel>().isPressed ||
                          percent < 0
                      ? const Color(0xFFD5D5D5)
                      : const Color(0xFF1773FC),
              animation: true,
              // TODO : animation 추가
              center: context.watch<CircularIndicatorViewModel>().isPressed
                  ? CircularInnerRemainingTime(
                      startDate: plan.startDate, endDate: plan.endDate)
                  : CircularInnerPlanTypeInfo(
                      remainAmount: plan.remainAmount,
                      totalAmount: plan.totalAmount),
            ),
          );
        });
  }
}
