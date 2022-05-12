import 'package:draganddrop1/provider/DragCard.dart';
import 'package:draganddrop1/widgets/DragCardWidget.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final card = Provider.of<DragCard>(context);
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
        body:ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1
                ),
                borderRadius: BorderRadius.circular(20)
              ),
              child:ListView.builder(
             itemCount: card.data.length,
            itemBuilder: (ctx, i) => DragCardWidget(
              name: card.data[i].name,
                 description: card.data[i].Description,
                job: card.data[i].job)) ,
            ),
             Container(
              margin: EdgeInsets.all(10),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1
                ),
                borderRadius: BorderRadius.circular(20)
              ),
              
            ),
              Container(
              margin: EdgeInsets.all(10),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1
                ),
                borderRadius: BorderRadius.circular(20)
              ),
            )
          ],
        )
       
                );
  }
}
