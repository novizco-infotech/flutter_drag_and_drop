import 'package:flutter/material.dart';

class FormFieldData extends StatefulWidget {
  const FormFieldData({ Key? key }) : super(key: key);

  @override
  State<FormFieldData> createState() => _FormFieldDataState();
}

class _FormFieldDataState extends State<FormFieldData> {
  final NameController=TextEditingController();
  final DateController=TextEditingController();
  final DescriptionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       TextFormField(
         controller: NameController,
         decoration: InputDecoration(
           hintText: 'Enter Name'
         ),
       ),
        TextFormField(
          controller: DateController,
           decoration: InputDecoration(
           hintText: 'Date'
         ),
        ),
         TextFormField(
           controller: DescriptionController,
            decoration: InputDecoration(
           hintText: 'Description'
         ),
         )
         
      ],
      
    );
  }
}