
import 'package:draganddrop1/model/draggableList.dart';
import 'package:draganddrop1/provider/DragCard.dart';
import 'package:draganddrop1/screens/myHome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
     ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child:
       MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          primarySwatch: Colors.blue,
        ),
        home:  MyHomePage(),
       )   
    );
  }
}
