import 'package:flutter/material.dart';

class Hcontact extends StatelessWidget {                //CONTACT US
  const Hcontact({Key? key, required Type Hcontact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Text('Contact us!',style: TextStyle(fontSize: 30),),
          backgroundColor: Colors.cyan,
          actions: [
            Icon(Icons.help_center),
          ],

        ),
        body:
        Column(
          children: [
            Expanded(child:
            Text('If you have any problem using the app feel free to call or email us, You can find the Phone-Number and E-mail down below. ',
              style: TextStyle(fontSize:35,fontWeight: FontWeight.w700  ),
            )),
            Expanded(child:
            Row(
              children: [
                const Icon(Icons.phone),
                const Text('+962xxxxxxxxx',style: TextStyle(fontSize:20,fontWeight: FontWeight.w700),),
                Spacer(),
                const Icon(Icons.mail),
                const Text('PharMap@xxxxx.com',style: TextStyle(fontSize:18,fontWeight: FontWeight.w700),),
              ],
            )
            )

          ],

        ),

      ),

    );
  }
}
