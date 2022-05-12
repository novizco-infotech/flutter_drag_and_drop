import 'package:flutter/material.dart';

class DragCardWidget extends StatelessWidget {
  final String name;
  final String description;
  final String job;
  DragCardWidget({required this.name,required this.description,required this.job});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 70,
      height: 70,
      child: Card(
              child: ListTile(
                title: Text(name),
                subtitle: Text(job),
                trailing:Text(description) ,
              ),
            ),
    );
    // Container(
    //   padding: const EdgeInsets.all(20),
    //   margin: const EdgeInsets.all(20),
    //   decoration: BoxDecoration(
    //     border: Border.all(
    //       width: 1
    //     ),
    //     borderRadius: BorderRadius.circular(20)
    //   ),
    //   width: 150,
    //   height: 150,
    //   child:Column(
    //     children: [
        
         
    //     ],
    //   ) ,
    // );
  }
}