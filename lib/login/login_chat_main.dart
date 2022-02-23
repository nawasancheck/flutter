
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/practice/functionAll.dart';
import 'google_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // QuerySnapshot querySnapshot2 = await FirebaseFirestore.instance.collection("user").where('role', isEqualTo: 'manager').get();
  //
  // List managerList = [];
  // for (int i = 0; i < querySnapshot2.docs.length; i++) {
  // //   managerList.add(querySnapshot2.docs[i].get('role'));
  // //   print(querySnapshot2.docs[i].get('role'));
  // }

  //
  // print(managerList.length);


  runApp(MyApp());




}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: App(),
    );
  }
}
