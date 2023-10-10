
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebaseprojecttttt/screnn/login.dart';
import 'package:firebaseprojecttttt/service/firebase.dart';
import 'package:firebaseprojecttttt/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseService  _firebaseservice=FirebaseService();
 _firebaseservice.connectNotification();
  FirebaseMessaging.instance.subscribeToTopic("topics");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>SayacProvider()),
    ChangeNotifierProvider(create: (context)=>AddListe())
  ], child: const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Grock.navigationKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}

