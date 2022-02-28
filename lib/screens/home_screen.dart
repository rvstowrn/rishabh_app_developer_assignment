import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:rishabh_app_developer_assignment/widgets/recommendation_section.dart';
import 'package:rishabh_app_developer_assignment/widgets/user_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: const [
            UserSection(),
            RecommendationSection(),
          ],
        ),
      ),
    );
  }
}
