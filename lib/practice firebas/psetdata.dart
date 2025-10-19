import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test/practice%20firebas/get_multiple_user_data.dart';

class Psetdata extends StatefulWidget {
  const Psetdata({super.key});

  @override
  State<Psetdata> createState() => _PsetdataState();
}

class _PsetdataState extends State<Psetdata> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Set Data Page"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: 250,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: 250,
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // setUserData(emailController.text, passwordController.text);
                },
                child: Text("Set Data"),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GetMultipleUserData(),
                    ),
                  );
                },
                child: Text("Get Maltile User Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  setUserData(String email, String password) async {
    FirebaseFirestore.instance.collection("userDataSet").doc("user1").set({
      "email": email,
      "password": password,
    }, SetOptions(merge: true));

    emailController.clear();
    passwordController.clear();
  }
}
