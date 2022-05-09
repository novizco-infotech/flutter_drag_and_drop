import 'package:flutter/material.dart';

class Xcontainer extends StatelessWidget {
 
  final String title;
  final Widget child;
 
  Xcontainer({required this.title ,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
                    child: ListTile(
                      title:Text(title) ,
                     
                    ),
                   
                    margin: EdgeInsets.all(10),
                    width: 300,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.grey)),
                  );
                
  }
}