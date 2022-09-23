import 'package:final_project/screens/sign_in_screen.dart';
import 'package:final_project/screens/third_screen.dart';
import 'package:flutter/material.dart';

import '../custom_colors.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {

    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Container(
              height: sh,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: CustomColors.cus_white
              )
          ),
          Column(
            children: [
              Container(
                height: .04*sh,width: .8*sw,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32))
                ),
              ),
              SizedBox(height: .07*sh,),
              Image.asset("assets/images/colored_logo.png",width: .6*sw,height: .08*sh,),
              SizedBox(height: .07*sh,),
              Image.asset("assets/images/second_screen.png",width: sw,height: .45*sh,),
              SizedBox(height: .03*sh,),
              Center(child: Text("Plan Your Trip",style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,fontSize: 28),)),
              SizedBox(height: .025*sh,),
              Text("Plan your trip, choose your destination",
                style: TextStyle(color: Colors.grey),),
              Text("Pick the best place for your holiday",
                style: TextStyle(color: Colors.grey),),
              SizedBox(height: .04*sh,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context) => SignInScreen() ));
                    },
                      child: Text("SKIP",style: TextStyle(color: Colors.grey),)),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:
                        (context) => ThirdScreen() ));
                      },
                      child: Text("NEXT",style: TextStyle(color: Colors.blue),)),
                ],
              ),
              SizedBox(height: .035*sh,),
              Container(
                  height: .01*sh,width: .3*sw,
                  decoration: BoxDecoration(
                      color: Colors.grey,
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


