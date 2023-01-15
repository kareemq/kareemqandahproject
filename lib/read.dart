import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Read extends StatefulWidget {
  const Read({Key? key}) : super(key: key);

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  late String email =' ';
  DocumentReference users = FirebaseFirestore.instance
      .collection('User')
      .doc('fO8nJOc67Jk0kYwib5Qy');

  void initState()
  {
    super.initState();
    users.get().then((DocumentSnapshot ds) {
      email = ds['email'];
      print(email);
    });
    print(email);
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
