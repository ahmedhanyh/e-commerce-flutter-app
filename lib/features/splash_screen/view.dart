import 'package:final_flutter_project/features/login/view.dart';
import 'package:final_flutter_project/features/navigation_bar/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;

    Future.delayed(Duration(seconds: 3), () {
      if (user == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return NavBar();
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC6C6C8),
      body: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 48),
        child: Container(
          height: 32,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Loading",
                style: TextStyle(
                  fontFamily: "Arimo",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 2,),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: const SpinKitThreeBounce(
                  color: Colors.white, // Change to your brand color
                  size: 15.0,         // Control how big the dots are
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
