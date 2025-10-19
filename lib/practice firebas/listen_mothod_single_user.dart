import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListenMothodSingleUser extends StatefulWidget {
  const ListenMothodSingleUser({super.key});

  @override
  State<ListenMothodSingleUser> createState() => _ListenMothodSingleUserState();
}

class _ListenMothodSingleUserState extends State<ListenMothodSingleUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [BackButton()]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 250,
                child: Center(
                  child: Text("Listen User email : ${email ?? ""}"),
                ),
                color: Colors.amberAccent,
              ),
              SizedBox(height: 10),
              Container(
                height: 60,
                width: 250,
                child: Center(
                  child: Text("Listen User password : ${password ?? ""}"),
                ),
                color: Colors.amberAccent,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  getUserUpdateOrFetchData();
                },
                child: Text("Listen Single user Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? email;
  String? password;

  Future<void> getUserUpdateOrFetchData() async {
    try {
      await FirebaseFirestore.instance
          .collection("userDataSet")
          .doc("user1")
          .snapshots()
          .listen((DocumentSnapshot snapShot) {
            setState(() {
              email = snapShot["email"];
              password = snapShot["password"];
            });
          });
    } catch (e) {}
  }
}
