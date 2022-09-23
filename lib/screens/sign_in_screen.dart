import 'dart:convert';


import 'package:final_project/responses/sign_in_response.dart';
import 'package:final_project/screens/city_screen.dart';
import 'package:final_project/screens/location_screen.dart';
import 'package:final_project/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../custom_colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  String email = "";
  String password = "";

  final _signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children:[
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
              SizedBox(height: .06*sh),
              Image.asset("assets/images/logo.png"),
              SizedBox(height: .06*sh),
              Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        Text("Sign In",style: TextStyle(color: Colors.black,fontSize: 28,
                        fontWeight: FontWeight.bold),),
                        SizedBox(height: .03*sh,),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Email"),
                          validator: (value){
                            if(value != null || value!.isEmpty || !value.contains("@"))
                              {
                                return "Enter valid email";
                              }
                            return null;
                          },
                          onSaved: (value){
                            setState(() {
                              email = value!;
                            });
                          },
                        ),
                        SizedBox(height: .02*sh,),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(labelText: "Password"),
                          validator: (value){
                            if(value != null || value!.isEmpty)
                            {
                              return "Enter valid password";
                            }
                            return null;
                          },
                          onSaved: (value){
                            setState(() {
                              password = value!;
                            });
                          },
                        ),
                        SizedBox(height: .01*sh,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          GestureDetector(child:
                          Text("Forget password?",style: TextStyle(color: Colors.blue),)
                          )
                        ],),
                        SizedBox(height: .02*sh,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(64)
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: CustomColors.cus_blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                            onPressed: (){
                            if(_signInFormKey.currentState!.validate()){
                              _signInFormKey.currentState!.save();
                            }
                            signIn();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: .01*sw),
                                Text("Sign in"),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(64),
                                        color: Colors.blueAccent
                                      ),
                                      child: Icon(Icons.arrow_forward_ios_outlined),
                                    )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: .03*sh,),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: .25*sh,),
              GestureDetector(child: Text("Don't have an account! Sign up",
              style: TextStyle(color: Colors.white)),
              onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SignUpScreen() ));
              }),
              SizedBox(height: .02*sh),
              Container(
                  height: .01*sh,width: .6*sw,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32)
                  )
              )
              ]
        )
        ]
      )
    );
  }
  Future signIn() async{

    Response response = await post(Uri.parse("http://alcaptin.com/api/login"),
    headers: {
      "Accept":"application/json",
    },
    body: {
      "email":"a@a.com",
        "password":"123456"
        }
    );
    dynamic jsonRespose = jsonDecode(response.body);
    SignInResponse signInResponse = SignInResponse.fromJson(jsonRespose);

    if(response.statusCode==200){
      Navigator.push(context, MaterialPageRoute(builder:
      (context)=> LocationScreen(token: signInResponse.data?.accessToken)));
    }
  }
}
