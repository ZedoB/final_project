import 'dart:convert';
import 'package:final_project/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:final_project/responses/sign_up_response.dart';
import '../custom_colors.dart';
import 'location_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

    String email = "";
    String password = "";
    String name = "";
    String phone = "";
    bool isTrue = false;

  final _signUpFormKey = GlobalKey<FormState>();

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
                      SizedBox(height: .05*sh),
                      Container(
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Form(
                            key: _signUpFormKey,
                            child: Column(
                              children: [
                                Text("Sign Up",style: TextStyle(color: Colors.black,fontSize: 28,
                                    fontWeight: FontWeight.bold),),
                                SizedBox(height: .03*sh,),
                                TextFormField(
                                  decoration: InputDecoration(labelText: "Name"),
                                  validator: (value){
                                    if(value != null || value!.isEmpty)
                                    {
                                      return "Enter valid Name";
                                    }
                                    return null;
                                  },
                                  onSaved: (value){
                                    setState(() {
                                      name = value!;
                                    });
                                  },
                                ),
                                SizedBox(height: .02*sh,),
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
                                SizedBox(height: .02*sh,),
                                TextFormField(
                                  decoration: InputDecoration(labelText: "Phone"),
                                  validator: (value){
                                    if(value != null || value!.isEmpty)
                                    {
                                      return "Enter valid phone";
                                    }
                                    return null;
                                  },
                                  onSaved: (value){
                                    setState(() {
                                      phone = value!;
                                    });
                                  },
                                ),
                                ListTile(
                                  leading: Checkbox(
                                    value: isTrue,
                                    onChanged: (value){
                                      setState(() {
                                        isTrue = value!;
                                      });
                                    },
                                  ),
                                  title: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      text: "I agree the",
                                      children: [
                                        TextSpan(
                                          text: " Terms & Conditions",style: TextStyle(color: Colors.blue)
                                        )
                                      ]
                                    ),

                                  ),
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
                                    onPressed: isTrue ? (){
                                      if(_signUpFormKey.currentState!.validate()){
                                        _signUpFormKey.currentState!.save();
                                      }
                                      signUp();
                                    } : null,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(width: .01*sw),
                                        Text("Sign Up"),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(64),
                                              color: isTrue ? Colors.blueAccent : Colors.grey
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
                      SizedBox(height: .02*sh,),
                      GestureDetector(child: Text("Already have an account? Login",
                          style: TextStyle(color: Colors.white)),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder:
                            (context)=> SignInScreen()));
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
    Future signUp() async{

      Response response = await post(Uri.parse("http://alcaptin.com/api/register"),
          headers: {
            "Accept":"application/json",
          },
          body: {
            "first_name":"ahmed",
            "last_name":"elshora",
            "email":"a@a.com",
            "password":"123456",
            "age":"28",
            "gender":"male"
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
