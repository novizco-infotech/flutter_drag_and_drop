import 'package:flutter/cupertino.dart';

class DraggableList{
  final String header;
  final List<DraggableListItem>items;
  DraggableList({required this.header,required this.items});
}
class DraggableListItem{
  final String title;
  final String description;
  final String job;
  DraggableListItem({required this.title,required this.description,required this.job});
}