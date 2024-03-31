import 'package:flutter/material.dart';
import 'package:flutter_study/widget/badge_widget.dart';
import 'package:flutter_study/widget/plan_summary_widget.dart';

class AppBarWidget extends AppBar {
  AppBarWidget(BuildContext context, {super.key})
      : super(
            title: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    showDragHandle: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) =>
                        const PlanSummaryWidget());
              },
              child: const Row(
                children: <Widget>[
                  Text(
                    '내 플랜',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 11.0),
                      child: BadgeWidget(text: '요약'))
                ],
              ),
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () => print('plus button clicked'),
                  icon: const Icon(Icons.add)),
              IconButton(
                  onPressed: () => print('more button clicked'),
                  icon: const Icon(Icons.more_horiz))
            ]);
}
