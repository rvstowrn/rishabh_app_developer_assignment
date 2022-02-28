import 'package:flutter/material.dart';
import 'package:rishabh_app_developer_assignment/globals.dart';
import 'package:rishabh_app_developer_assignment/provider/data_provider.dart';
import 'package:rishabh_app_developer_assignment/screens/loader_screen.dart';
import 'package:rishabh_app_developer_assignment/screens/login_screen.dart';
import 'package:rishabh_app_developer_assignment/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => DataProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rishabh App Developer Assignment',
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: loaderRoute,
      routes: {
        homeRoute: (context) => const HomeScreen(),
        loginRoute: (context) => const LoginScreen(),
        loaderRoute: (context) => const LoaderScreen(),
      },
    );
  }
}
