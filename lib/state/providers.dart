import 'package:flutter/cupertino.dart';

class SayacProvider with ChangeNotifier{
  int sayi=0;
  void sayiArttir(){
    sayi++;
    notifyListeners(); // dinleyicilere bildir
  }
}

class AddListe with ChangeNotifier{
    List<String> urunListesi=["Elma", "Portakal", "Kiraz"];
    int get count=>urunListesi.length;
    String getCard(int index )=>urunListesi[index];

    void addLiseleme(String meyve){
      urunListesi.add(meyve);
      notifyListeners();
      
    }
 void removeList(){
      urunListesi.removeAt(urunListesi.length-1);
      notifyListeners();
 }
}