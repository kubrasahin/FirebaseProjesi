import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebaseprojecttttt/screnn/ikinciSyafa.dart';
import 'package:firebaseprojecttttt/screnn/login.dart';
import 'package:firebaseprojecttttt/state/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:provider/provider.dart';

class HomeScreenn extends StatefulWidget {
  const HomeScreenn({super.key});

  @override
  State<HomeScreenn> createState() => _HomeScreennState();
}

class _HomeScreennState extends State<HomeScreenn> {
  String? meyve;
  TextEditingController meyveController=TextEditingController();
  late final FirebaseMessaging messaging;
  final firebaseAuth= FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    connectNotification();
    super.initState();
  }


  void settingNotification()async{
    await messaging.requestPermission(
        alert: true,
        sound: true,
        badge: true
    );
  }
  void connectNotification() async{
    await Firebase.initializeApp();
    messaging=FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        sound: true,
        badge: true);
    settingNotification();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {   //mesajı dinleme
      print(event.notification!.title);
     Grock.snackBar(title: "${event.notification!.title}", description: "${event.notification!.body}", opacity: 0.5, position: SnackbarPosition.top, );
    });

    messaging.getToken().then((value) async{
      print("Token:$value");
    },  );

  }
  @override
  Widget build(BuildContext context) {
   final uruncart= Provider.of<AddListe>(context);
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
          }, child: Text("Çıkış")),

          Text("${Provider.of<SayacProvider>(context).sayi}"),
         IconButton(onPressed: (){
           Provider.of<SayacProvider>(context, listen: false).sayiArttir();
         }, icon:Icon(Icons.add)),
          TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ikinciSyafa()));
          }, child: Text(" Diger Sayfa"),),

           Expanded(child: ListView.builder(shrinkWrap: true, itemCount:uruncart.count, itemBuilder: (context, index ){
             return Card(
               child: ListTile(title: Text(uruncart.getCard(index)),),
             );
           })),
          TextFormField(
            controller: meyveController,
            onSaved: (value){
              meyve=value;
            },
            decoration: InputDecoration(
              hintText: "Meyve Giriniz"
            ),
          ),
           InkWell(onTap: (){
             uruncart.addLiseleme(meyveController.text);
           }, child: Container( child: Text("MEYVE EKLE "),))
        ],
      ),)),
    );
  }
}
