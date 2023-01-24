import 'package:flutter/material.dart';
import 'package:kareem_qandah/about.dart';
import 'package:kareem_qandah/contact.dart';
import 'package:kareem_qandah/login.dart';
import 'package:kareem_qandah/phar.dart';
class important extends StatefulWidget {

  const important({Key? key, required Type important}) : super(key: key);

  @override
  State<important> createState() => _importantState();
}


class _importantState extends State<important> {
  _importantState({Key? key,  important}) ;

// This is the root widget
// of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GFG(),
    );
  }
}
class GFG extends StatefulWidget {
  const GFG({Key? key}) : super(key: key);

  @override
  State<GFG> createState() => _GFGState();
}

class _GFGState extends State<GFG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PharMap",
          style: TextStyle(fontSize: 25,color: Colors.black87),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate()
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset('assets/logonew.jpg'),
      ),


      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                accountName: Text(" PharMap ", style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700),),
                accountEmail: Text("Drawer Menu")
                 //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader

            //DrawerHeader
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Homepage'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Home(Home: Home),
                ),);
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Contact us!'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Hcontact(Hcontact: Hcontact),
                ),);
              },
            ),
            AboutListTile( // <-- SEE HERE
              icon: Icon(
                Icons.info,
              ),
              child: Text('About app'),
              applicationIcon: Icon(
                Icons.local_play,
              ),
              applicationName: 'PharMap',
              applicationVersion: '2.0.0',
              applicationLegalese: '© 2023 Company',
              aboutBoxChildren: [
                ///Content goes here...
              ],
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginPage(LoginPage: LoginPage),
                ),);
              },
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: const Text('Close Drawer'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const important(important: important),
                ),);
              },
            ),
          ],
        ),
      ), //Drawer
    );
  }
}
class Pharmacy {
  Pharmacy(this.name, this.id, this.medications, this.distance);

  String name;
  double? distance;
  List<String> medications;
  int id;
}

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying

  List<Pharmacy> pharmacies = [
    Pharmacy('Pharmacy 1', 1, ['Panadol', 'zonax'], 2),
    Pharmacy('Pharmacy 2', 2, ['Acetaminophen', 'Adderall'], 3),
    Pharmacy('Pharmacy 3', 3, ['Amlodipine', 'Amoxicillin'], 5),
    Pharmacy('Pharmacy 4', 4, ['Ativan', 'Atorvastatin'], 1),
    Pharmacy('Pharmacy 5', 5, ['Panadol', 'Zyrtic'], 1),
    Pharmacy('Pharmacy 6', 6, ['EyeDrop', 'Baclofen'], 18),
    Pharmacy('Pharmacy 7', 7, ['zonax', 'Calcium'], 33),
    Pharmacy('Pharmacy 8', 8, ['Amlodipine', 'Bruffen'], 21),
    Pharmacy('Pharmacy 9', 9, ['Ativan', 'Amoclan'], 4),
    Pharmacy('Pharmacy 10', 10, ['Bruffen', 'Zyrtic'], 6),
  ];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<Pharmacy> matchQuery = [];
    matchQuery = pharmacies
        .where((element) => element.medications.any(
            (element) => element.toLowerCase().contains(query.toLowerCase())))
        .toList();
    matchQuery.sort(((a, b) => a.distance!.compareTo(b.distance!)));
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        int nameOfMedication = matchQuery[index].medications.indexWhere(
              (element) => element.toLowerCase().contains(query.toLowerCase()),
        );
        return ListTile(
          title: Text(matchQuery[index].medications[nameOfMedication]),
          leading: Text(matchQuery[index].name),
          trailing: Text(matchQuery[index].distance.toString()),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Pharmacy> matchQuery = [];
    matchQuery = pharmacies
        .where((element) => element.medications.any(
            (element) => element.toLowerCase().contains(query.toLowerCase())))
        .toList();
    matchQuery.sort(((a, b) => a.distance!.compareTo(b.distance!)));
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        int nameOfMedication = matchQuery[index].medications.indexWhere(
              (element) => element.toLowerCase().contains(query.toLowerCase()),
        );
        return ListTile(
          title: Text(matchQuery[index].medications[nameOfMedication]),
          leading: Text(matchQuery[index].name),
          trailing: Text(matchQuery[index].distance.toString()),
        );
      },
    );
  }
}



