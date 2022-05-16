import 'package:flutter/material.dart';

class DragCardWidget extends StatelessWidget {
  final String name;

  final String job;
  DragCardWidget({required this.name, required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: Card(
        child: ListTile(
          title: Text(name),
          subtitle: Text(job),
        ),
      ),
    );
  }
}
