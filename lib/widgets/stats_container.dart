import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:rishabh_app_developer_assignment/widgets/stats_item.dart';

class StatsContainer extends StatelessWidget {
  const StatsContainer({
    Key? key,
    required this.won,
    required this.played,
    required this.percent,
  }) : super(key: key);

  final String won;
  final String played;
  final String percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: StatsItem(
                color: Colors.orange,
                heading: won,
                subHeading: "Tournament\n Won"),
          ),
          Expanded(
            child: StatsItem(
                color: Colors.indigo,
                heading: played,
                subHeading: "Tournament\n Played"),
          ),
          Expanded(
            child: StatsItem(
                color: Colors.red,
                heading: percent,
                subHeading: "Winning\n Percentage"),
          )
        ],
      ),
    );
  }
}
