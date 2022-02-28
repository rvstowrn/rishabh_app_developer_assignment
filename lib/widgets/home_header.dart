import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:rishabh_app_developer_assignment/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({Key? key, required this.menuTitle}) : super(key: key);
  final String menuTitle;

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      setState(() {
        prefs = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Icon(CupertinoIcons.text_alignleft),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(widget.menuTitle, style: headerStyle),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: const Icon(CupertinoIcons.square_arrow_right),
              onTap: () {
                prefs.setBool("authenticated", false);
                Navigator.pushReplacementNamed(context, loginRoute);
              },
            ),
          )
        ],
      ),
    );
  }
}
