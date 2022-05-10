import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:draganddrop1/model/dragable_list.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<DragableList> allList = [
    DragableList(header: 'Fruits', items: [
      DragableListItems(tittle: 'Apple'),
      DragableListItems(tittle: 'Banana'),
      DragableListItems(tittle: 'Apricot'),
      DragableListItems(tittle: 'Grape')
    ]),
    DragableList(header: 'Vegitables', items: [
      DragableListItems(tittle: 'Tomato'),
      DragableListItems(tittle: 'potato'),
      DragableListItems(tittle: 'Brinjal'),
      DragableListItems(tittle: 'cucumber'),
    ]),
    DragableList(header: 'Dry Fruits', items: [
      DragableListItems(tittle: 'Apricot'),
      DragableListItems(tittle: 'Almond'),
      DragableListItems(tittle: 'Dates'),
       DragableListItems(tittle: 'Ashwenut'),
    ])
  ];

  late List<DragAndDropList> list;

  @override
  void initState() {
    super.initState();
    list = allList.map(buildList).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Drag And Drop'),
          centerTitle: true,
        ),
        body:  Container(
          width: 1000,
          
          child: DragAndDropLists(
          
              
              // addLastItemTargetHeightToTop: true,
              axis: Axis.horizontal,
              listWidth: 150,
              listDraggingWidth: 150,
              lastItemTargetHeight: 5,
              itemDecorationWhileDragging: BoxDecoration(color: Colors.cyan),
              itemDivider: Divider(
                color: Colors.grey,
                thickness: 2,
                height: 5,
              ),
              listPadding: EdgeInsets.all(10),
              listInnerDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 115, 143, 146)),
              children: list,
              onItemReorder: onReorderListItems,
              onListReorder: onReorderList,
            ),
        ),
        );
  }

  DragAndDropList buildList(DragableList list) => DragAndDropList(
      children: list.items
          .map((item) => DragAndDropItem(
                  child: ListTile(
                title: Center(child: Text(item.tittle)),
              )))
          .toList(),
      header: Container(padding: EdgeInsets.all(8), child: Text(list.header)));


  void onReorderListItems(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      final oldListItems = list[oldItemIndex].children;
      final newListitems = list[newListIndex].children;
      final movedItem = oldListItems.removeAt(oldItemIndex);
      newListitems.insert(newItemIndex, movedItem);
    });
  }

  void onReorderList(int oldListIndex, int newListIndex) {
    setState(() {
      final movedlist=list.removeAt(oldListIndex);
      list.insert(newListIndex, movedlist);
    });
  }
}
