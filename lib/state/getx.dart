import 'package:get/get.dart';

class GetxKullanimi extends GetxController{
  var count = 0.obs;
  void increment() {
    count++;
    update();
  }

}