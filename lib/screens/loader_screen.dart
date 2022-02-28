import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rishabh_app_developer_assignment/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

void handleRouting(BuildContext context) {
  SharedPreferences.getInstance().then((pref) {
    if (pref.getBool("authenticated") ?? false) {
      Navigator.pushReplacementNamed(context, homeRoute);
    } else {
      Navigator.pushReplacementNamed(context, loginRoute);
    }
  });
}

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    handleRouting(context);
    return const Center(child: CircularProgressIndicator());
  }
}
