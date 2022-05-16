import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:draganddrop1/model/dragList.dart';
import 'package:draganddrop1/provider/draggableList.dart';

import 'package:draganddrop1/widgets/form.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void openPopUp() =>
      showDialog(context: context, builder: (_) => const FormFieldData());

  late List<DragAndDropList> lists;

  @override
  void didChangeDependencies() {
    final data = Provider.of<DataProvider>(context, listen: false).allLists;
    lists = data.map(buildList).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // print("widget");

    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.purple,
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
          listDecorationWhileDragging: const BoxDecoration(
              color: Colors.white70,
              boxShadow: [BoxShadow(color: Colors.red, blurRadius: 20)]),
          itemDivider: const SizedBox(
            height: 2,
          ),
          lastItemTargetHeight: 350,
          axis: Axis.horizontal,
          listPadding: const EdgeInsets.all(16),
          listInnerDecoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(10),
          ),
          children: value.allLists.map(buildList).toList(),
          itemDraggingWidth: 400,
          onItemReorder: onReorderListItem,
          onListReorder: onReorderList,
          listWidth: 400,
        ),
      ),
    );
  }

  DragAndDropList buildList(DraggableList list) => DragAndDropList(
        contentsWhenEmpty: Text(''),
         canDrag: false,
        header: Container(
        
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Text(
              list.header,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        children: list.items
            .map(
              (item) => DragAndDropItem(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Card(
                        elevation: 20,
                        child: ListTile(
                          title: Text(item.name),
                          trailing: Text(item.Category),
                          subtitle: Text(item.dateTime.toString()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
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
  ) {}
}
