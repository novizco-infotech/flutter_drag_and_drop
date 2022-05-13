import 'package:draganddrop1/model/dragList.dart';
import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier {
List<DraggableList> allLists =  [
  DraggableList(
    header: 'To Do',
    items: [
      DraggableListItem(
        title: 'Rashid',
        description: 'Add',
        job: 'devoloper'
      ),
    ],
  ),
  DraggableList(
    header: 'OnProgress',
    items: [],
  ),
  DraggableList(
    header: 'Completed',
    items: [],
  ),
];

void addProduct(String name,String description,String job) async {
  final product = DraggableListItem(title: name,description: description,job: job);
    allLists[0].items.add(product);
    notifyListeners();
}
}

