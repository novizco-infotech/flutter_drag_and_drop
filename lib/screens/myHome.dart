
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';

import 'package:draganddrop1/model/dragable_list.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final String apple1=;
  final List<DragableList> allList = [
    DragableList(header: 'FRUITS', items: [
      DragableListItems(
          tittle: 'Apricot', color: const Color.fromARGB(255, 116, 106, 78),imageUrl: 'assets/Apricot1.jpg'),
      DragableListItems(
          tittle: 'Banana', color: const Color.fromARGB(255, 184, 176, 103),imageUrl: 'assets/banana1.jpg'),
      DragableListItems(
          tittle: 'potato', color: const Color.fromARGB(255, 73, 71, 53),imageUrl: 'assets/potato1.jpg'),
      DragableListItems(
          tittle: 'Cashewnut', color: const Color.fromARGB(153, 139, 111, 111),imageUrl: 'assets/cashwe1.webp'),
    ]),
    DragableList(header: 'VEGITABLE', items: [
      DragableListItems(
          tittle: 'Tomato', color: const Color.fromARGB(255, 215, 111, 104),
          imageUrl: 'assets/tomato1.jpg'),
      DragableListItems(tittle: 'Almond', color: Colors.amberAccent,imageUrl: 'assets/almond1.jpg'),
      DragableListItems(
          tittle: 'orange', color: const Color.fromARGB(255, 211, 154, 63),imageUrl: 'assets/orange1.jpg'),
      DragableListItems(
          tittle: 'Corrot', color: const Color.fromARGB(255, 71, 95, 72),imageUrl: 'assets/carrots.webp'),
    ]),
    DragableList(header: 'DRY FRUITS', items: [
      DragableListItems(
          tittle: 'Apple', color: const Color.fromARGB(255, 141, 93, 90),imageUrl: 'assets/Apple1.jpg'),
      DragableListItems(
          tittle: 'Brinjal', color: const Color.fromARGB(255, 157, 102, 167),imageUrl: 'assets/brinjal1.jpg'),
      DragableListItems(tittle: 'Dates', color: Colors.black45,imageUrl: 'assets/Dates1.jpg'),
      DragableListItems(
          tittle: 'Grape', color: const Color.fromARGB(255, 177, 135, 185),imageUrl: 'assets/grape1.jpg')
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
        title: const Text('Drag And Drop'),
        centerTitle: true,
      ),
      body: Container(
        // padding: EdgeInsets.all(20),
        // margin: EdgeInsets.all(20),
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     width: 1
        //   ),
        //   borderRadius: BorderRadius.circular(40)

        // ),

        child: DragAndDropLists(
          addLastItemTargetHeightToTop: false,

          axis: Axis.horizontal,
          listWidth: 160,
          listDraggingWidth: 160,
          lastItemTargetHeight: 50,
          //  itemDecorationWhileDragging: const BoxDecoration(color: Colors.cyan),
          // itemDivider: const Divider(
          //   color: Colors.grey,
          //   thickness: 2,

          // ),
          //      listDragHandle: const DragHandle(
          //   verticalAlignment: DragHandleVerticalAlignment.top,
          //   child: Padding(
          //     padding: EdgeInsets.only(right: 10),
          //     child: Icon(
          //       Icons.menu,
          //       color: Colors.black26,
          //     ),
          //   ),
          // ),

//  itemDragHandle: const DragHandle(
//           child: Padding(
//             padding: EdgeInsets.only(right: 10),
//             child: Icon(
//               Icons.menu,
//               color: Colors.blueGrey,
//             ),)),

          listPadding: const EdgeInsets.all(10),
          listInnerDecoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(20),
              color: Colors.white),
          children: list,
          onItemReorder: onReorderListItems,
          onListReorder: onReorderList,
        ),
      ),
    );
  }

  DragAndDropList buildList(DragableList list) => DragAndDropList(
      canDrag: false, //when we give it's true then we can drag the either list.
      lastTarget: Container(
        height: 300,
      ),
      children: list.items
          .map((item) => DragAndDropItem(
                  child: SizedBox(
                height: 170,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(image:AssetImage(item.imageUrl) ),
                            color: item.color,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1)),
                        child: ListTile(title: Center(child: Text(item.tittle))),
                          
                      ),
                    ),
                  ],
                ),
              )))
          .toList(),
      header: Center(
        child: Container(
            width: 150,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 115, 143, 146),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1),
            ),
            padding: const EdgeInsets.all(8),
            child: Text(list.header)),
      ));

  void onReorderListItems(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = list[oldListIndex].children.removeAt(oldItemIndex);
      list[newListIndex].children.insert(newItemIndex, movedItem);
      ;
    });
  }

  void onReorderList(int oldListIndex, int newListIndex) {
    setState(() {
      final movedlist = list.removeAt(oldListIndex);
      list.insert(newListIndex, movedlist);
    });
  }
}
