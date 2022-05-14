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
  final NameController = TextEditingController();
  final CategoryController = TextEditingController();
  final DateController = TextEditingController();
  final CategoryfocusNode = FocusNode();
  final DAtefocusnode = FocusNode();
  final form = GlobalKey<FormState>();

  @override
  void dispose() {
    CategoryfocusNode.dispose();
    DAtefocusnode.dispose();

    super.dispose();
  }

  void saveForm() {
    final isValid = form.currentState!.validate();
    if (!isValid) {
      return;
    }
    form.currentState!.save();

    final name = NameController.text;
    final dateTime = DateController.text;
    final category = CategoryController.text;
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
      DateController.text = DateFormat('yyy-MM-dd').format(picker);
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                
                controller: NameController,
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
                  ;
                },
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(CategoryfocusNode);
                },
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: CategoryController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Catagory'),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                  validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Name';
                  }
                  if (value == null) {
                    return 'enter';
                  }
                  ;
                },
                focusNode: CategoryfocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(DAtefocusnode);
                },
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: DateController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Date',
                    suffixIcon: Icon(Icons.date_range)),
                onTap: () => Datefunction(context),
                focusNode: DAtefocusnode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(DAtefocusnode);
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
