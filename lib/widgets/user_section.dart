import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:rishabh_app_developer_assignment/model/profile.dart';
import 'package:rishabh_app_developer_assignment/provider/data_provider.dart';
import 'package:rishabh_app_developer_assignment/widgets/home_header.dart';
import 'package:rishabh_app_developer_assignment/widgets/profile_card.dart';
import 'package:rishabh_app_developer_assignment/widgets/stats_container.dart';

class UserSection extends StatelessWidget {
  const UserSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<DataProvider>().getProfileData(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const UpdatedUserSection();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class UpdatedUserSection extends StatelessWidget {
  const UpdatedUserSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Profile profile = context.watch<DataProvider>().profile;
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        HomeHeader(
          menuTitle: profile.menuTitle,
        ),
        ProfileCard(
          name: profile.name,
          rating: profile.rating,
          avatarUrl: profile.avatarUrl,
        ),
        StatsContainer(
          won: profile.won,
          played: profile.played,
          percent: profile.percent,
        )
      ],
    );
  }
}
