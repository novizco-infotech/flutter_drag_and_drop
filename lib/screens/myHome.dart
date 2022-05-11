import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:draganddrop1/model/dragable_list.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<DragableList> allList = [
    DragableList(header: 'FRUITS', items: [
      DragableListItems(tittle: 'Apple',color: const Color.fromARGB(255, 141, 93, 90)),
      DragableListItems(tittle: 'Banana',color: const Color.fromARGB(255, 184, 176, 103)),
      DragableListItems(tittle: 'orange',color:const Color.fromARGB(255, 211, 154, 63) ),
      DragableListItems(tittle: 'Grape',color: const Color.fromARGB(255, 177, 135, 185))
    ]),
    DragableList(header: 'VEGITABLE', items: [
      DragableListItems(tittle: 'Tomato',color: const Color.fromARGB(255, 215, 111, 104)),
      DragableListItems(tittle: 'potato',color: const Color.fromARGB(255, 73, 71, 53)),
      DragableListItems(tittle: 'Brinjal',color:const Color.fromARGB(255, 157, 102, 167)),
      DragableListItems(tittle: 'cucumber',color: const Color.fromARGB(255, 71, 95, 72)),
    ]),
    DragableList(header: 'DRY FRUITS', items: [
      DragableListItems(tittle: 'Apricot',color: const Color.fromARGB(255, 116, 106, 78)),
      DragableListItems(tittle: 'Almond',color: Colors.amberAccent),
      DragableListItems(tittle: 'Dates',color: Colors.black45),
      DragableListItems(tittle: 'Cashewnut',color: const Color.fromARGB(153, 139, 111, 111)),
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
            addLastItemTargetHeightToTop: true,
            axis: Axis.horizontal,
            listWidth: 160,
            listDraggingWidth: 160,
            lastItemTargetHeight: 5,
           // itemDecorationWhileDragging: const BoxDecoration(color: Colors.cyan),
            // itemDivider: const Divider(
            //   color: Colors.grey,
            //   thickness: 2,
            //   height: 5,
            // ),
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
      children: list.items
          .map((item) => DragAndDropItem(
                  child: SizedBox(
                height: 170,
                child:
                Column(
                  children: 
                    [Container(
                      width: 200,
                       height: 100,
                      decoration: BoxDecoration(
                        color: item.color,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1
                        )
                      ),
                       child: Center(child: Text(item.tittle)),
                    ),
                  ],
                ),
              )))
          .toList(),
          
      header: Center(
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 115, 143, 146),
            borderRadius: BorderRadius.circular(10)
            ,border: Border.all(
              width: 1
            ),
            
          ),
          padding: const EdgeInsets.all(8), child: Text(list.header)),
      ));

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
      final movedlist = list.removeAt(oldListIndex);
      list.insert(newListIndex, movedlist);
    });
  }
}
