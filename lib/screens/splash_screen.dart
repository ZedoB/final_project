import 'dart:async';

import 'package:final_project/screens/second_screen.dart';
import 'package:flutter/material.dart';

import '../custom_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                SecondScreen()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {

    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: sh,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    CustomColors.cus_blue,
                    CustomColors.cus_magenta,
                  ]
                ),
              )
          ),
          Column(
            children: [
              Container(
                height: .04*sh,width: .8*sw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32))
                ),
              ),
              SizedBox(height: .35*sh,),
              Center(
                child:Image.asset("assets/images/logo.png",width: .5*sw,height: .2*sh,),
              ),
              SizedBox(height: .3*sh,),
              Container(
                height: .01*sh,width: .6*sw,
                  decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(32)
              )
              )
            ],
          )
        ],
      )
    );
  }
}


