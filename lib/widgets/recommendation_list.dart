import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:rishabh_app_developer_assignment/model/tournament.dart';
import 'package:rishabh_app_developer_assignment/provider/data_provider.dart';
import 'package:rishabh_app_developer_assignment/widgets/recommendation_card.dart';

class RecommendationList extends StatelessWidget {
  const RecommendationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: context.watch<DataProvider>().tournaments.length,
        itemBuilder: (BuildContext context, int index) {
          Tournament tournament =
              context.watch<DataProvider>().tournaments[index];
          return RecommendationCard(
            tournament: tournament,
          );
        });
  }
}
