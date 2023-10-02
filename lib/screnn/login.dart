

import 'package:firebaseprojecttttt/screnn/home.dart';
import 'package:firebaseprojecttttt/screnn/sign.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  late String email, password;
final firebaseAuth= FirebaseAuth.instance;
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
                  controller:_email ,
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
                  validator: (value){
                    if (value!.isEmpty) {
                      return "Lütfen şifrenizi giriniz";
                    } else {
                      return null;
                    }
                  },
    onSaved: (value){
      password=value!;
    },
    obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      hintText: "Password",

                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async{
                if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    try{
      final useraResult= await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => HomeScreenn()),
      );
      print( "DFFFFFFFFFFFFFFFFF");
      print(useraResult.user!.email );
    } catch(e){
      print( "AAAAAAAAAAAAAAA");
print(e.toString());
    }
    }
  else
    {}


                },




            child: Container(
              width: 100,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("Giriş", style: TextStyle(color: Colors.black),)),
                ),
              ),
          ),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SignScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text("Kayıt ol"),),
              ),
            )
        ],
      ),))
    );
  }
}
