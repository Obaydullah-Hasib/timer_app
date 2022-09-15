import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier{

  bool themChange = false;

  void changeToDark(){
    themChange = false;
    notifyListeners();
  }
  void changeToLight(){
    themChange = true;
    notifyListeners();
  }
}