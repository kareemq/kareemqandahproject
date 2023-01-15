import 'package:flutter/material.dart';
import 'package:kareem_qandah/about.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'login.dart';

class SignupPage extends StatefulWidget {

  const SignupPage({Key? key, required Type SignupPage}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late String email;
  late String password;
  late String fullname;

  Future login() async{
    adduser(email, password,fullname);
  }
  Future adduser(String email,String password, String fullName) async{
    await FirebaseFirestore.instance.collection('User').add({
      'email':email,
      'password':password,
      'fullName':fullName
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,

                    ),),
                  SizedBox(height: 20,),
                  Text("Create an account, It's free ",
                    style: TextStyle(
                        fontSize: 15,
                        color:Colors.grey[700]),)


                ],
              ),
              Column(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 50),child: Column(
                          children: [
                            Padding(padding: const EdgeInsets.all(2.0)),
                            Material(elevation: 30,shadowColor: Colors.black.withOpacity(1),
                              child: TextField(decoration: InputDecoration(hintText: 'FullName',fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                                autocorrect: false,
                                obscureText: true,
                                onChanged: (value){
                                  fullname = value;
                                },
                              ),),
                            Padding(padding: const EdgeInsets.all(5.0)),
                            Material(elevation: 30,shadowColor: Colors.black.withOpacity(1),
                              child: TextField(
                                decoration: InputDecoration(hintText: 'Email',fillColor: Colors.white ,
                                  border: InputBorder.none,
                                ),
                                onChanged: (value){
                                  email = value;
                                },),),
                            Padding(padding: const EdgeInsets.all(2.0)),
                            Material(elevation: 30,shadowColor: Colors.black.withOpacity(1),
                              child: TextField(decoration: InputDecoration(hintText: 'Password',fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                                autocorrect: false,
                                obscureText: true,
                                onChanged: (value){
                                  password = value;
                                },
                              ),)
                          ],
                        ),
                        )
                      ],

                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration:
                BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),



                    )

                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    login();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage(LoginPage: LoginPage),
                    ),);
                  },
                  color: Color(0xff0095FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),

                  ),
                  child: Text(
                    "Sign up", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,

                  ),
                  ),

                ),



              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  const LoginPage(LoginPage: LoginPage),
                    ),);
                  },child: Text('Log in'),
                  )
                ],
              )



            ],

          ),


        ),

      ),

    );
  }
}



// we will be creating a widget for text field
Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}