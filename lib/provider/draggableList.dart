import 'package:draganddrop1/model/dragList.dart';
import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier {
  List<DraggableList> allLists = [
    DraggableList(
      header: 'Category',
      items: [
        DraggableListItem(title: 'Adam', job: ' engineer'),
      ],
    ),
    DraggableList(
      header: 'Engineers',
      items: [],
    ),
    DraggableList(
      header: 'Doctors',
      items: [],
    ),
  ];

  void addProduct(
    String name,
    String description,
    String job,
  ) {
    final product = DraggableListItem(title: name, job: job);
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
