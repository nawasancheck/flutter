import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReserveScreen extends StatelessWidget {
  final String managerUID;
  final String managerName;

  const ReserveScreen(this.managerUID, this.managerName, {Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser!;

    late String wantTime;
    late String requests;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                wantTime = value.trim();
              },
            ),
            TextField(
              onChanged: (value) {
                requests = value.trim();
              },
            ),
            TextButton(
                onPressed: () async {
                  // await FirebaseFirestore.instance.collection("reserve").doc(managerUID).collection(currentUser.uid).add({
                  //   'wantTime': wantTime,
                  //   'requests': requests,
                  //   'time': Timestamp.now().toDate(),
                  //   'client': currentUser.uid,
                  //   'status': status.toString()
                  // });

                  DocumentReference<Map<String, dynamic>> docs2 =
                      await FirebaseFirestore.instance.collection("client_reserve").doc(currentUser.uid).collection('reserve').add({
                    'wantTime': wantTime,
                    'requests': requests,
                    'time': Timestamp.now().toDate(),
                    'managerUid': managerUID,
                    'status': '산책예약',
                    'managerImageUrl': 'assets/wonjae2.png',
                    'managerName': managerName,
                  });
                  docs2.update({'id': docs2.id});
                },
                child: Text("산책 예약"))
          ],
        ),
      ),
    );
  }
}
