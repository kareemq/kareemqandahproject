import 'package:flutter/material.dart';
import 'package:kareem_qandah/drawer.dart';
class Home extends StatefulWidget {

  const Home({Key? key, required Type Home}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('About Us',style: TextStyle(color: Colors.black87),),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded (child:
            Image.asset('assets/logonew.jpg',
              width: 350,height: 300,
            ),
            ),
            Spacer(),
            const Expanded(
              flex: 2,
              child:Text(' PharmaMap is an application that  helps you find your medicine that you  are looking for without going out of  your home and search in the  traditional way, just search your  medicine and the app will give you  the nearest pharmacy that has what  are you looking for, aswell as  PharmaMap offers you everyday  promotions and many more ! ',
                style: TextStyle(
                  fontSize: 22.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            MaterialButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const important(important: important),
                ),);
              },
              height: 45,
              minWidth: 240,
              child: const Text('Next Page', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              textColor: Colors.black87,
              color: Colors.blue,
              shape: const StadiumBorder(),
            ),

          ],
        )

    );
  }
}