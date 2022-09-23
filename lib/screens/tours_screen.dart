import 'dart:convert';

import 'package:final_project/responses/places_response.dart';
import 'package:final_project/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../custom_colors.dart';

class ToursScreen extends StatefulWidget {
  ToursScreen({Key? key, String? token}) : super(key: key);
  String? token;


  @override
  State<ToursScreen> createState() => _ToursScreenState();
}

class _ToursScreenState extends State<ToursScreen> {
  String? token;

  Places? places;
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
              SizedBox(height: .02*sh),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.format_list_bulleted),
                  Text("TOURS", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
                  Icon(Icons.search)
                ],
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Popular Destination",style: TextStyle(color: CustomColors.cus_blue,fontSize: 28
                            ,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Row(
                        children: [
                          Text("10 tours available",style: TextStyle(color: Colors.grey,))
                        ]),
                  ],
                ),
              ),
              Image.asset("assets/images/cities_small_pics.png",width: sw,height: .12*sh,),
              Container(
                height: .35*sh,width: sw,
                child: Stack(
                      children: [
                        Image.asset("assets/images/ski.png",width: sw,),
                        Center(child: Column(
                            children: [
                              SizedBox(height: .075*sh),
                              Image.asset("assets/images/ski2.png",width: .6*sw,),
                            ]
                        ))
                      ],
                    ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text("Discover new places",style: TextStyle(color: CustomColors.cus_blue,
                        fontWeight: FontWeight.bold,fontSize: 28),)
                  ],
                ),
              ),
              Expanded(child: GridView.builder(itemBuilder: (context,index){
                InnerData item = places!.data! as InnerData;
                return GestureDetector(
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  => CityScreen(token: widget.token)));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.network("/uploads/places/166034502923218.jpeg"),
                        Text((item.description).toString(),style: TextStyle(color: Colors.blue),),
                        Text((item.name).toString())
                      ],
                    ),
                  ),
                );
              },gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: 3,)

              )
            ])
          ])
    );
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
