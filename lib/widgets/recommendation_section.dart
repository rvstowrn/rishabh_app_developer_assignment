import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:rishabh_app_developer_assignment/globals.dart';
import 'package:rishabh_app_developer_assignment/provider/data_provider.dart';
import 'package:rishabh_app_developer_assignment/widgets/recommendation_list.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<DataProvider>().getTournamentsList(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const UpdatedRecommendationSection();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class UpdatedRecommendationSection extends StatelessWidget {
  const UpdatedRecommendationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: const [
          Text(
            "Recommended for you",
            style: titleStyle,
          ),
          RecommendationList()
        ]);
  }
}
