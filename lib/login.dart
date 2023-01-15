import 'package:flutter/material.dart';
import 'package:kareem_qandah/about.dart';
import 'package:kareem_qandah/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'signup.dart';


class LoginPage extends StatefulWidget {

  const LoginPage({Key? key, required  LoginPage,}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.mode_night,
              size: 20,
              color: Colors.black,),

          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Login",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text("Login to your account",
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
                Padding(padding:
                EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
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
                      onPressed: () async {
                        try {
                          final newUser = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);

                          if (newUser != null) {

                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Home(Home: Home),
                            ),);
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      color: Color(0xff0095FF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: Text(
                        "Login", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,

                      ),
                      ),

                    ),
                  ),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    TextButton(onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>  const SignupPage(SignupPage: SignupPage),
                      ),);
                    }, child: Text('Sign up'),


                    )
                  ],
                ),

                Container(
                  padding: EdgeInsets.only(top: 100),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/loginlogo.jpg"),
                        fit: BoxFit.fitHeight
                    ),

                  ),
                )

              ],
            ))
          ],
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