import 'package:draganddrop1/model/dragList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataProvider with ChangeNotifier {
  List<DraggableList> allLists = [
    DraggableList(
      header: 'ToDo ',
      items: [
        DraggableListItem(
            name: 'Adam',
            Category: ' Flutter devoloper',
            dateTime: DateFormat('yyy-MM-dd').format(DateTime.now())),
      ],
      
    ),
    DraggableList(
      header: 'onProgress',
      items: [],
    ),
    DraggableList(
      header: 'Completed',
      items: [],
    ),
  ];

  void addProduct(String name, String category, String date) {
    final product =
        DraggableListItem(name: name, Category: category, dateTime: date);
    allLists[0].items.add(product);
    notifyListeners();
  }

  void insertItem(
      int oldListIndex, int oldItemIndex, int newListIndex, int newItemIndex) {
    var movedItem = allLists[oldListIndex].items.removeAt(oldItemIndex);
    allLists[newListIndex].items.insert(newItemIndex, movedItem);
    notifyListeners();
  }

 
}
