import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_role_app/login_screen.dart';
import 'package:multi_role_app/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';
    if (isLogin) {
      if (userType == 'student') {
        Timer(const Duration(seconds: 3), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StudentScreen(),
            ),
          );
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage(
            'https://images.pexels.com/photos/1316484/pexels-photo-1316484.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
      ),
    );
  }
}
