import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../custom_colors.dart';
import '../responses/places_response.dart';

class CityScreen extends StatefulWidget {
  CityScreen({Key? key, String? token}) : super(key: key);
  String? token;


  @override
  State<CityScreen> createState() => _CityScreenState();

}

class _CityScreenState extends State<CityScreen> {
  Places? places;




  @override
  Widget build(BuildContext context) {


    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    InnerData item = places!.data! as InnerData;

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
            SizedBox(height: .02*sh),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  GestureDetector(child: Icon(Icons.arrow_back_ios_new,color: Colors.grey,),
                  onTap: (){
                    Navigator.pop(context);
                  }),
                  Text("Back",style: TextStyle(color: Colors.grey),)
                ],),
                Text("Paris", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
                Icon(Icons.search,color: Colors.grey)
              ],
            ),
            SizedBox(height: .01*sh,),
            Container(
              height: .35*sh,width:.5*sw,
              child: Stack(
                children: [
                  Image.network(item.images![0],width: sw,),
                  Center(child: Column(children: [
                    SizedBox(height: .2*sh,),
                    Image.network(item.images![1])
                  ],),)
                ],
              ),
            ),
            Center(child: Text("Disneyland Paris",style: TextStyle(fontSize: 28,
                fontWeight: FontWeight.bold),),),
            SizedBox(height: .01*sh,),
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Column(children: [
                Row(children: [Text("Departure",style: TextStyle(fontSize: 28,
                  fontWeight: FontWeight.bold),)],),
                SizedBox(height: .01*sh,),
                Row(children: [Text((item.name).toString(),style: TextStyle(color: Colors.grey),)],),
                SizedBox(height: .01*sh,),
                Row(children: [Text("Duration",style: TextStyle(fontSize: 28,
                  fontWeight: FontWeight.bold),)],),
                SizedBox(height: .01*sh,),
                Row(children: [Text((item.whatsapp).toString(),style: TextStyle(color: Colors.grey),)],),
                SizedBox(height: .01*sh,),
                Row(children: [Text("Discover 7 world heritage sites in this tour",style: TextStyle(fontSize: 28,
                  fontWeight: FontWeight.bold),)],),
                SizedBox(height: .01*sh,),
                Row(children: [Text((item.description).toString(),style: TextStyle(color: Colors.grey),)],),
              ],
              ),
            )
          ])
        ]));
  }
  Future tours() async{
    Response response = await get(Uri.parse("http://alcaptin.com/api/places"),
        headers: {
          "Authorization":"Bearer ${widget.token}"
        });

    dynamic convertedJson = jsonDecode(response.body);
    places = Places.fromJson(convertedJson);
  }
}
