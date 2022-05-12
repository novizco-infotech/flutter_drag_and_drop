import 'package:draganddrop1/model/ListModel.dart';
import 'package:flutter/material.dart';


class DragCard with ChangeNotifier{
  List<ListModel> _data=[];
  List<ListModel> get data{
    return [..._data];
    
  }
  void AddCard(ListModel model){
    final NewData=ListModel(name: model.name,
     Description: model.Description,
      job: model.job);
      // _data.add(NewData);
      _data.insert(0, NewData);
      notifyListeners();
  }
}