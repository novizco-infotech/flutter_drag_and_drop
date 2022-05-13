import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/draggableList.dart';

class FormFieldData extends StatefulWidget {
  const FormFieldData({Key? key}) : super(key: key);

  @override
  State<FormFieldData> createState() => _FormFieldDataState();
}

class _FormFieldDataState extends State<FormFieldData> {
  final NameController = TextEditingController();
  final DateController = TextEditingController();
  final DescriptionController = TextEditingController();
  final DateFocasNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  final form = GlobalKey<FormState>();
 
  @override
  void dispose() {
    DateFocasNode.dispose();
    descriptionFocusNode.dispose();

    super.dispose();
  }

  void saveForm() {
    form.currentState!.save();

    final name = NameController.text;
    final des = DescriptionController.text;
    final job = DateController.text;
    Provider.of<DataProvider>(context, listen: false)
        .addProduct(name, des, job);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: NameController,
                decoration: const InputDecoration(hintText: 'Enter Name'),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(DateFocasNode);
                },
              ),
              TextFormField(
                controller: DateController,
                decoration: const InputDecoration(hintText: 'job'),
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.next,
                focusNode: DateFocasNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(descriptionFocusNode);
                },
              ),
            ],
          ),
        ),
      ),
      title: const Center(
        child: Text(
          'Add Details',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              saveForm();
              Navigator.of(context).pop();
            },
            child: const Text('save')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'))
      ],
    );
  }
}
