import 'package:flutter/cupertino.dart';

//NOTIFYING THE CHANGES
class ModelClass extends ChangeNotifier{
  int _score=0;
  int get getScore =>_score;

  void increment(){
    _score++;
    notifyListeners();
  }

  void decrement(){
    _score--;
    notifyListeners();
  }
}