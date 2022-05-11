import 'package:flutter/cupertino.dart';

class DragableList{
  final String header;
  final List<DragableListItems>items;
  DragableList({required this.header,required this.items});
}
class DragableListItems{
  final String tittle;
  final Color color;
  final String imageUrl;

  DragableListItems({required this.tittle,required this.color,required this.imageUrl});
}