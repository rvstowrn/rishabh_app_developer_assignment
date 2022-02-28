import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:rishabh_app_developer_assignment/globals.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {Key? key,
      required this.name,
      required this.rating,
      required this.avatarUrl})
      : super(key: key);

  final String name;
  final String rating;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            child: ClipOval(
              clipBehavior: Clip.hardEdge,
              child: Image(
                image: NetworkImage(
                  "https://static.remove.bg/remove-bg-web/a72f919da581145bc8a52ac0c5d21f5c4741f367/assets/start-0e837dcc57769db2306d8d659f53555feb500b3c5d456879b9c843d1872e7baa.jpg",
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: titleStyle),
              const SizedBox(
                height: 10,
              ),
              Chip(
                padding: const EdgeInsets.all(8),
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.blue),
                label: Row(
                  children: [
                    Text(
                      rating,
                      style: titleStyle.apply(color: Colors.blue),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Elo Rating",
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
