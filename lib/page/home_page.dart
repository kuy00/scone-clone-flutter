import 'package:flutter/material.dart';
import 'package:flutter_study/widget/app_bar_widget.dart';
import 'package:flutter_study/widget/badge_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarWidget(),
      ),
      body: const Center(
        child: BadgeWidget(text: '요약'),
      ),
    );
  }
}
