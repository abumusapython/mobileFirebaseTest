import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddAcreen extends StatefulWidget {
  const AddAcreen({super.key});

  @override
  State<AddAcreen> createState() => _AddAcreenState();
}

class _AddAcreenState extends State<AddAcreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login", // responsive text
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50),

            /// Email
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 20),

            /// Password
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 30),

            /// Login Button
            ElevatedButton(
              onPressed: () {
                addUserData(emailController.text, passwordController.text);
              },
              child: Text("LoginTest"),
            ),
          ],
        ),
      ),
    );
  }

  addUserData(String email, String password) async {
    await FirebaseFirestore.instance.collection("userLoginData").add({
      'email': email,
      'password': password,
    });

    emailController.clear();
    passwordController.clear();
  }
}
