import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/reserve_status.dart';

class ReserveTest extends StatelessWidget {
  final String managerUID;
  const ReserveTest(this.managerUID, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser!;

    late String wantTime;
    late String requests;
    late final String status = ReserveStatus.RESERVE.toString();

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
                  await FirebaseFirestore.instance.collection("reserve").doc(managerUID).collection(currentUser.uid).add(
                      {'wantTime': wantTime, 'requests': requests, 'time': Timestamp.now().toDate(), 'client': currentUser.uid, 'status': status});

                  await FirebaseFirestore.instance
                      .collection("client_reserve")
                      .doc(currentUser.uid)
                      .collection(managerUID)
                      .add({'wantTime': wantTime, 'requests': requests, 'time': Timestamp.now().toDate(), 'manager': managerUID, 'status': status});
                },
                child: Text("산책 예약"))
          ],
        ),
      ),
    );
  }
}
