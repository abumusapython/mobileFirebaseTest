import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetMultipleUserData extends StatefulWidget {
  const GetMultipleUserData({super.key});

  @override
  State<GetMultipleUserData> createState() => _GetMultipleUserDataState();
}

class _GetMultipleUserDataState extends State<GetMultipleUserData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [BackButton()]),
        body: Column(
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listOfUserLoginData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.green),
                      child: Column(
                        children: [
                          Text(
                            listOfUserLoginData[index]
                                    .get("email")
                                    ?.toString() ??
                                "Email not found",
                          ),
                          Text(
                            listOfUserLoginData[index]
                                    .get("password")
                                    ?.toString() ??
                                "Password not found",
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                getMultiUserData();
              },
              child: Text("Get Multiple Data"),
            ),
          ],
        ),
      ),
    );
  }

  List<DocumentSnapshot> listOfUserLoginData = [];
  Future<void> getMultiUserData() async {
    try {
      await FirebaseFirestore.instance.collection("userLoginData").get().then((
        QuerySnapshot snapShot,
      ) {
        listOfUserLoginData.clear();
        listOfUserLoginData.addAll(snapShot.docs);
        setState(() {});
      });
    } catch (e) {
      print("The error is : ${e}");
    }
  }
}
