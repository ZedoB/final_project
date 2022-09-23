import 'package:flutter/material.dart';

import '../custom_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    Widget icon = Icon(Icons.arrow_forward_ios_rounded);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(children: [
          Container(
          height: sh,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: CustomColors.cus_white)),
        Column(children: [
          Container(
            height: .04 * sh,
            width: .8 * sw,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(child: Icon(Icons.close,),
              onTap: (){
              Navigator.pop(context);
              }),
            ],),
          Center(child: Column(children: [
            Image.asset("assets/images/profile_pic.png",fit: BoxFit.cover,),
            Text("Kenneth Gutierrez",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
            Text("Kenneth_gutierrez@gmail.com",style: TextStyle(color: Colors.grey),)
          ],)),
          SizedBox(height: .1*sh,),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Column(children: [
                Row(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(32)
                    ),
                    height: .03*sw,width: .03*sw,
                    child: Icon(Icons.notifications,color:Colors.white),
                  ),
                  Text("Notification",style: TextStyle(fontSize: 28),),
                  Expanded(
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [icon]))
                ]),
                SizedBox(height: .025*sh),
                Row(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(32)
                    ),
                    height: .03*sw,width: .03*sw,
                    child: Icon(Icons.airplanemode_on,color:Colors.white),
                  ),
                  Text("Tours",style: TextStyle(fontSize: 28),),
                  Expanded(
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [icon]))
                ]),
                SizedBox(height: .025*sh),
                Row(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(32)
                    ),
                    height: .03*sw,width: .03*sw,
                    child: Icon(Icons.location_on,color:Colors.white),
                  ),
                  Text("Location",style: TextStyle(fontSize: 28),),
                  Expanded(
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [icon]))
                ]),
                SizedBox(height: .025*sh),
                Row(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(32)
                    ),
                    height: .03*sw,width: .03*sw,
                    child: Icon(Icons.language,color:Colors.white),
                  ),
                  Text("Language",style: TextStyle(fontSize: 28),),
                  Expanded(
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [icon]))
                ]),
                SizedBox(height: .025*sh),
                Row(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(32)
                    ),
                    height: .03*sw,width: .03*sw,
                    child: Icon(Icons.person_add,color:Colors.white),
                  ),
                  Text("Invite Friends",style: TextStyle(fontSize: 28),),
                  Expanded(
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [icon]))
                ]),
                SizedBox(height: .025*sh),
                Row(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                        borderRadius: BorderRadius.circular(32)
                    ),
                    height: .03*sw,width: .03*sw,
                    child: Icon(Icons.headphones,color:Colors.white),
                  ),
                  Text("Help Center",style: TextStyle(fontSize: 28),),
                  Expanded(
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [icon]))
                ]),
                SizedBox(height: .025*sh),
                Row(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(32)
                    ),
                    height: .03*sw,width: .03*sw,
                    child: Icon(Icons.settings,color:Colors.white),
                  ),
                  Text("Settings",style: TextStyle(fontSize: 28),),
                  Expanded(
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [icon]))
                ]),
                SizedBox(height: .025*sh),
                Row(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(32)
                    ),
                    height: .03*sw,width: .03*sw,
                    child: Icon(Icons.logout,color:Colors.white),
                  ),
                  Text("Log Out",style: TextStyle(fontSize: 28),),
                  Expanded(
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [icon]))
                ]),
              ]),
          ),
        ])
      ])
    );
  }
}
