import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/draggableList.dart';

class FormFieldData extends StatefulWidget {
  const FormFieldData({Key? key}) : super(key: key);

  @override
  State<FormFieldData> createState() => _FormFieldDataState();
}

class _FormFieldDataState extends State<FormFieldData> {
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final dateController = TextEditingController();
  final categoryfocusNode = FocusNode();
  final datefocusnode = FocusNode();
  final namefocusnode = FocusNode();
  final form = GlobalKey<FormState>();

  @override
  void dispose() {
    categoryfocusNode.dispose();
    datefocusnode.dispose();

    super.dispose();
  }

  void saveForm() {
    final isValid = form.currentState!.validate();
    if (!isValid) {
      return;
    }
    form.currentState!.save();

    final name = nameController.text;
    final dateTime = dateController.text;
    final category = categoryController.text;
    Provider.of<DataProvider>(context, listen: false)
        .addProduct(name, category, dateTime);
  }

  Future<void> Datefunction(
    BuildContext context,
  ) async {
    DateTime? picker = await showDatePicker(
        context: context,
        initialDate: DateTime(2022),
        firstDate: DateTime(2022),
        lastDate: DateTime(2050));
    if (picker != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(picker);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: form,
          child: PreferredSize(
            preferredSize:const Size.fromHeight(120.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                namefield(),
                const SizedBox(
                  height: 5
                ),
                categoryfield(),
                const SizedBox(
                  height:5
                ),
                datefield()
              ],
            ),
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

  Widget namefield() {
    return TextFormField(
      controller: nameController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: 'Enter Name'),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Name';
        }
        if (value == null) {
          return 'enter';
        }
        
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(categoryfocusNode);
      },
    );
  }

  Widget categoryfield() {
    return TextFormField(
      controller: categoryController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: 'Catagory'),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter category';
        }
        if (value == null) {
          return 'enter';
        }
        
      },
      focusNode: categoryfocusNode,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(datefocusnode);
      },
    );
  }

  Widget datefield() {
    return TextFormField(
      controller: dateController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Date',
          suffixIcon: Icon(Icons.date_range)),
      onTap: () => Datefunction(context),
      focusNode: datefocusnode,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter category';
        }
        if (value == null) {
          return 'enter';
        }
        
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(datefocusnode);
      },
    );
  }
}
