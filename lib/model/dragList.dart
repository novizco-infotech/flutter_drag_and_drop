

class DraggableList {
  final String header;

  final List<DraggableListItem> items;
  DraggableList({
    required this.header,
    required this.items,
  });
}

class DraggableListItem {
  final String name;
  
  final String Category;
   final String dateTime;
  
  
  DraggableListItem({required this.name, required this.Category,
   required this.dateTime 
  });
}
