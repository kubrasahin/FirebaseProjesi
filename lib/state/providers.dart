import 'package:flutter/cupertino.dart';

class SayacProvider with ChangeNotifier{
  int sayi=0;
  void sayiArttir(){
    sayi++;
    notifyListeners(); // dinleyicilere bildir
  }
}