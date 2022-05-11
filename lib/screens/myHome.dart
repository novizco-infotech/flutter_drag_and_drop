
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';

import 'package:draganddrop1/model/dragable_list.dart';
import 'package:draganddrop1/widgets/form.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final String apple1=;
 

 void openPopUp(BuildContext context)=>showDialog(
   context: context,
  builder: (ctx)=>AlertDialog(
    title: Text('Enter Your Details'),
    content:FormFieldData(),
    actions: [
      TextButton(onPressed: (){}, child: Text('Save')),
       TextButton(onPressed: (){
         Navigator.pop(context);
       }, child: Text('Cancel'))
    ],
  )
  );

  @override
  void initState() {
    
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            openPopUp(context);
          }, icon:Icon(Icons.add))
        ],
        title: const Text('Drag And Drop'),
        centerTitle: true,
      ),
      body: Container());
  }}
//         // padding: EdgeInsets.all(20),
//         // margin: EdgeInsets.all(20),
//         // decoration: BoxDecoration(
//         //   border: Border.all(
//         //     width: 1
//         //   ),
//         //   borderRadius: BorderRadius.circular(40)

//         // ),

//         child: DragAndDropLists(
//           addLastItemTargetHeightToTop: false,

//           axis: Axis.horizontal,
//           listWidth: 160,
//           listDraggingWidth: 160,
//           lastItemTargetHeight: 50,
//           //  itemDecorationWhileDragging: const BoxDecoration(color: Colors.cyan),
//           // itemDivider: const Divider(
//           //   color: Colors.grey,
//           //   thickness: 2,

//           // ),
//           //      listDragHandle: const DragHandle(
//           //   verticalAlignment: DragHandleVerticalAlignment.top,
//           //   child: Padding(
//           //     padding: EdgeInsets.only(right: 10),
//           //     child: Icon(
//           //       Icons.menu,
//           //       color: Colors.black26,
//           //     ),
//           //   ),
//           // ),

// //  itemDragHandle: const DragHandle(
// //           child: Padding(
// //             padding: EdgeInsets.only(right: 10),
// //             child: Icon(
// //               Icons.menu,
// //               color: Colors.blueGrey,
// //             ),)),

//           listPadding: const EdgeInsets.all(10),
//           listInnerDecoration: const BoxDecoration(
//               // borderRadius: BorderRadius.circular(20),
//               color: Colors.white),
//           children: list,
//           onItemReorder: onReorderListItems,
//           onListReorder: onReorderList,
//         ),
//       ),
//     );
//   }

//   DragAndDropList buildList(DragableList list) => DragAndDropList(
//       canDrag: false, //when we give it's true then we can drag the either list.
//       lastTarget: Container(
//         height: 300,
//       ),
//       children: list.items
//           .map((item) => DragAndDropItem(
//                   child: SizedBox(
//                 height: 170,
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         margin: const EdgeInsets.all(10),
//                         width: 200,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(image:AssetImage(item.imageUrl,
                          
//                           ) ,fit: BoxFit.cover),
//                             // color: item.color,
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(width: 1)),
//                         child: ListTile(title: Center(child: Text(item.tittle))),
                          
//                       ),
//                     ),
//                   ],
//                 ),
//               )))
//           .toList(),
//       header: Center(
//         child: Container(
//             width: 150,
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 115, 143, 146),
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(width: 1),
//             ),
//             padding: const EdgeInsets.all(8),
//             child: Text(list.header)),
//       ));

//   void onReorderListItems(
//       int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
//     setState(() {
//       var movedItem = list[oldListIndex].children.removeAt(oldItemIndex);
//       list[newListIndex].children.insert(newItemIndex, movedItem);
//       ;
//     });
//   }

//   void onReorderList(int oldListIndex, int newListIndex) {
//     setState(() {
//       final movedlist = list.removeAt(oldListIndex);
//       list.insert(newListIndex, movedlist);
//     });
//   }
// }
