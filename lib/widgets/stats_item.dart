import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:rishabh_app_developer_assignment/globals.dart';

class StatsItem extends StatelessWidget {
  const StatsItem(
      {Key? key,
      required this.color,
      required this.heading,
      required this.subHeading})
      : super(key: key);

  final Color color;
  final String heading;
  final String subHeading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: color,
      child: Column(
        children: [
          Text(heading,
              style: secondaryTitleStyle, textAlign: TextAlign.center),
          const SizedBox(
            height: 3,
          ),
          Text(subHeading,
              style: secondaryTextStyle, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
