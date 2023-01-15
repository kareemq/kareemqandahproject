import 'package:flutter/material.dart';
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