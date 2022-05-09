
import 'package:draganddrop1/widgets/xcontainer.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag And Drop'),
        centerTitle: true,
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 800,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    child: Column(
                      children: [
                         ListTile(
                        title: Text('Block 1'),
                        trailing:
                            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                      ),
                     Draggable(
                       feedback: buildwidget(context,Colors.red),
                       child: buildwidget(context,Colors.red),
                       childWhenDragging: Container(),
                       )
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                    width: 300,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.grey)),
                  ),
                  Xcontainer(title: 'Block 2',child:Container(
                    margin: EdgeInsets.all(10),
                       width: MediaQuery.of(context).size.width,
                       height: 50,
                       decoration: BoxDecoration(
                         color: Colors.black,
                         borderRadius: BorderRadius.circular(20)
                       ),
                     )),
                  // Xcontainer('Block 3')
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
Widget buildwidget(BuildContext context,  Color color){
  return  Container(
                    margin: EdgeInsets.all(10),
                       width: MediaQuery.of(context).size.width,
                       height: 50,
                       decoration: BoxDecoration(
                         color: color,
                         borderRadius: BorderRadius.circular(20)
                       ),
                     );
}