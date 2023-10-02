

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseprojecttttt/screnn/home.dart';
import 'package:firebaseprojecttttt/screnn/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/usermodels.dart';
class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  late String  ad, soyad, email, sifre, sifretekrar;
  final firebaseAuth= FirebaseAuth.instance;


  kayit(String mail, String password)async{
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

        final userResult= await firebaseAuth.createUserWithEmailAndPassword(email: mail, password: password).then((value) {
          postt();
        });
          }
    else
    {
      print("HATAAAAA");
    }
  }

  postt() async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = firebaseAuth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = ad;
    userModel.secondName = soyad;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreenn()),
            (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container( decoration: BoxDecoration(color: Colors.blue),
            child: Form(
              key: formKey,
              child: Column(

                children: [
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: ( value){
                          if (value!.isEmpty) {
                            return "Lütfen Adınızı giriniz";
                          } else {
                            return null;
                          }
                        },

                        onSaved: (value){
                          ad=value!;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            hintText: "Ad"
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: ( value){
                          if (value!.isEmpty) {
                            return "Lütfen Soyadınızı giriniz";
                          } else {
                            return null;
                          }
                        },

                        onSaved: (value){
                          soyad=value!;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            hintText: "Soyad"
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: TextFormField(
                        controller: emailEditingController,
                        keyboardType: TextInputType.emailAddress,
                        validator: ( value){
                          if (value!.isEmpty) {
                            return "Lütfen emailinizi giriniz";
                          } else {
                            return null;
                          }
                        },

                        onSaved: (value){
                          email=value!;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            hintText: "mail"
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: TextFormField(
                        controller: passwordEditingController,
                        validator: (value){
                          if (value!.isEmpty) {
                            return "Lütfen şifrenizi giriniz";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value){
                          sifre=value!;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          hintText: "Şifre",

                        ),
                      ),
                    ),
                  ),

                 InkWell(
                    onTap: () {
                      kayit( emailEditingController.text, passwordEditingController.text );
                    },
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text("Kayıt Ol", style: TextStyle(color: Colors.black),)),
                      ),
                    ),
                  ),
                ],
              ),))
    );
  }
}
