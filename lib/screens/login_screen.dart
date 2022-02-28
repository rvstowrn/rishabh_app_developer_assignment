import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:rishabh_app_developer_assignment/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Constants
bool commonValidityCondition(String input) {
  return input.length >= 3 && input.length <= 11;
}

String invalidInputLengthError = "Min Length 3, Max Length 11";

// Pure Widget Functions
Widget logo() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.grey[700],
    ),
    child: Image.asset(
      'assets/game_tv.png',
      height: 100,
      width: 200,
    ),
  );
}

Widget input(
  String hintText,
  TextEditingController controller,
  String errorText,
  Function validator,
  bool obscureText,
) {
  return SizedBox(
    height: 40,
    width: 200,
    child: TextField(
      obscureText: obscureText,
      controller: controller,
      onChanged: (val) {
        validator(val);
      },
      style: const TextStyle(
        fontSize: 15.0,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText,
      ),
    ),
  );
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passController = TextEditingController();
  String userErrorText = "";
  String passErrorText = "";
  bool disableSubmit = true;
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

  updateSubmitState() {
    setState(() {
      disableSubmit = !commonValidityCondition(usernameController.text) ||
          !commonValidityCondition(passController.text);
    });
  }

  validatePassInput(String val) {
    setState(() {
      passErrorText =
          commonValidityCondition(val) ? "" : invalidInputLengthError;
    });
    updateSubmitState();
  }

  validateUserInput(String val) {
    setState(() {
      userErrorText =
          commonValidityCondition(val) ? "" : invalidInputLengthError;
    });
    updateSubmitState();
  }

  handleLogin(BuildContext context) {
    bool valid = validUsers.any((element) {
      return element["user"] == usernameController.text &&
          element["pass"] == passController.text;
    });
    if (valid) {
      prefs.setBool("authenticated", true);
      usernameController.clear();
      passController.clear();
      Navigator.pushReplacementNamed(context, homeRoute);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Invalid username/password'),
      ));
    }
  }

  Widget submitButton(BuildContext context) {
    return ButtonTheme(
      child: OutlinedButton(
        onPressed: disableSubmit
            ? null
            : () {
                handleLogin(context);
              },
        child: const Text(
          "LOGIN",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          fixedSize: const Size(200, 40),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo(),
            const SizedBox(height: 50),
            input(
              "Username",
              usernameController,
              userErrorText,
              validateUserInput,
              false,
            ),
            const SizedBox(height: 40),
            input(
              "*******",
              passController,
              passErrorText,
              validatePassInput,
              true,
            ),
            const SizedBox(height: 30),
            submitButton(context),
          ],
        ),
      ),
    ));
  }
}
