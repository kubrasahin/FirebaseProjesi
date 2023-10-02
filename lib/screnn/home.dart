import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseprojecttttt/screnn/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenn extends StatefulWidget {
  const HomeScreenn({super.key});

  @override
  State<HomeScreenn> createState() => _HomeScreennState();
}

class _HomeScreennState extends State<HomeScreenn> {
  final firebaseAuth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("HOME"),
          InkWell(onTap: (){
            firebaseAuth.signOut(); //çıkış işlemi
              Navigator.push(context, MaterialPageRoute (
                builder: (BuildContext context) =>LoginScreen()
              ), );
          }, child: Text("Çıkış"))
        ],
      ),)),
    );
  }
}
