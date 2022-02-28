import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:rishabh_app_developer_assignment/globals.dart';
import 'package:rishabh_app_developer_assignment/model/tournament.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({Key? key, required this.tournament})
      : super(key: key);
  final Tournament tournament;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
                alignment: const Alignment(-.2, 0),
                image: NetworkImage(tournament.coverUrl),
                fit: BoxFit.fill),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tournament.name,
                        style: titleStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(tournament.gameName, style: subtitleStyle),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
