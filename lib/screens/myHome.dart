import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:draganddrop1/model/dragList.dart';
import 'package:draganddrop1/model/draggableList.dart';


import 'package:draganddrop1/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/DragCard.dart';


class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  void openPopUp() =>
      showDialog(context: context, builder: (_) => FormFieldData());
      late List<DragAndDropList>lists;
       @override
 
  // @override
  // void didChangeDependencies() {
  //   final data =Provider.of<DataProvider>(context,listen: false).allLists; 
  //  lists = data.map(buildList).toList();
  //   super.didChangeDependencies();
  // }
  @override
  Widget build(BuildContext context) {
    print("widget");

    return Scaffold(
      backgroundColor: Colors.grey[350],
        appBar: AppBar(
         
          actions: [
            IconButton(
                onPressed: () {
                  openPopUp();
                },
                icon: Icon(Icons.add))
          ],
          title: const Text('Drag And Drop'),
          centerTitle: true,
        ),
           body: Consumer<DataProvider>(
             builder: (context, value, child) => 
              DragAndDropLists(
                   // lastItemTargetHeight: 50,
                   // addLastItemTargetHeightToTop: true,
                   lastListTargetSize: 70,
                   axis: Axis.horizontal,
                   listPadding: const EdgeInsets.all(16),
                   listInnerDecoration: BoxDecoration(
                     color: Theme.of(context).canvasColor,
                     borderRadius: BorderRadius.circular(10),
                   ),
                   children: value.allLists.map(buildList).toList(),
                   //itemDraggingWidth: 200,
                   
                 
                   itemDecorationWhileDragging: const BoxDecoration(
                     color: Colors.white,
                     boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                   ),
                 
                   onItemReorder: onReorderListItem,
                   onListReorder: onReorderList,
                   listWidth: 200,
           
                 ),
           ),
    );
  }

  DragAndDropList buildList(DraggableList list) => DragAndDropList(
        header: Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            list.header,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        children: list.items
            .map((item) => DragAndDropItem(
                  child: Container(
                    height: 100,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child:ListTile(
                      title: Text(item.title),
                      subtitle: Text(item.description),
                      trailing: Text(item.job),
                    ),
                  ),
                ))
            .toList(),
      );

  void onReorderListItem(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      var movedItem = lists[oldListIndex].children.removeAt(oldItemIndex);
      lists[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  void onReorderList(
    int oldListIndex,
    int newListIndex,
  ) {
    setState(() {
      final movedList = lists.removeAt(oldListIndex);
      lists.insert(newListIndex, movedList);
    });
  }
}
