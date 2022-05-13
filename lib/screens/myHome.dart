import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:draganddrop1/model/dragList.dart';
import 'package:draganddrop1/provider/draggableList.dart';

import 'package:draganddrop1/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void openPopUp() =>
      showDialog(context: context, builder: (_) => FormFieldData());

  late List<DragAndDropList> lists;

  @override
  void didChangeDependencies() {
    final data = Provider.of<DataProvider>(context, listen: false).allLists;
    lists = data.map(buildList).toList();
    super.didChangeDependencies();
  }

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
        builder: (context, value, child) => DragAndDropLists(
        
          listDecorationWhileDragging:const BoxDecoration(
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
              color: Colors.red,
              blurRadius: 20
            )
          ]
          ),
          itemDivider: const SizedBox(
            height: 2,
          ),
          lastItemTargetHeight: 850,

          axis: Axis.horizontal,
          listPadding: const EdgeInsets.all(16),
          listInnerDecoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(10),
          ),
          children: value.allLists.map(buildList).toList(),
          itemDraggingWidth: 150,

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
          height: 40,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.indigo,
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, blurRadius: 10, offset: Offset(20, 10))
              ],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1)),
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(
              list.header,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        children: list.items
            .map((item) => DragAndDropItem(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    height: 100,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: Offset(10, 10))
                        ],
                        color: Colors.orange,
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      title: Text(item.title),
                      subtitle: Text(item.job),
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
    Provider.of<DataProvider>(context, listen: false)
        .insertItem(oldListIndex, oldItemIndex, newListIndex, newItemIndex);
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
