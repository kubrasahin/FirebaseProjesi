import 'package:firebaseprojecttttt/state/getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../state/providers.dart';

class ikinciSyafa extends StatefulWidget {
  const ikinciSyafa({super.key});

  @override
  State<ikinciSyafa> createState() => _ikinciSyafaState();
}

class _ikinciSyafaState extends State<ikinciSyafa> {
  final controller = Get.put(GetxKullanimi());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Obx(()=> Text(controller.count.toString())),
          IconButton(onPressed: (){
           controller.increment();
          }, icon:Icon(Icons.add)),


        ],
      ),)),
    );
  }
}
