import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/providers.dart';

class ikinciSyafa extends StatefulWidget {
  const ikinciSyafa({super.key});

  @override
  State<ikinciSyafa> createState() => _ikinciSyafaState();
}

class _ikinciSyafaState extends State<ikinciSyafa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text("${Provider.of<SayacProvider>(context).sayi}"),
          IconButton(onPressed: (){
            Provider.of<SayacProvider>(context, listen: false).sayiArttir();
          }, icon:Icon(Icons.add)),


        ],
      ),)),
    );
  }
}
