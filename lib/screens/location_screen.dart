import 'package:final_project/screens/tours_screen.dart';
import 'package:final_project/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../custom_colors.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({Key? key, String? token}) : super(key: key);
  String? token;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {

    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

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
            SizedBox(height: .02 * sh),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(child: Icon(Icons.format_list_bulleted),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                  (context)=> ProfileScreen()));
                },),
                Text("Location", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
                SizedBox(width: .04*sw)
              ],
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.all(.04*sh),
                color: CustomColors.cus_white,
                child: Image.asset(
                  "assets/images/cities.png", width: sw, height: .8*sh,),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => ToursScreen(token: widget.token)));
              },
            )
          ]),
        ]));
  }
}
