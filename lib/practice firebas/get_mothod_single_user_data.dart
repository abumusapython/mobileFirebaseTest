import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetMothodSingleUserData extends StatefulWidget {
  const GetMothodSingleUserData({super.key});

  @override
  State<GetMothodSingleUserData> createState() =>
      _GetMothodSingleUserDataState();
}

class _GetMothodSingleUserDataState extends State<GetMothodSingleUserData> {
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
                width: 200,
                child: Center(child: Text("User email : ${email ?? ""}")),
                color: Colors.amberAccent,
              ),
              SizedBox(height: 10),
              Container(
                height: 60,
                width: 200,
                child: Center(child: Text("User password : ${password ?? ""}")),
                color: Colors.amberAccent,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  getMothodSingleUserData();
                },
                child: Text("Get Single user Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? email;
  String? password;

  Future<void> getMothodSingleUserData() async {
    try {
      await FirebaseFirestore.instance
          .collection("userDataSet")
          .doc("user1")
          .get()
          .then((DocumentSnapshot snapShot) {
            setState(() {
              email = snapShot["email"];
              password = snapShot["password"];
            });
          });
    } catch (e) {}
  }
}
