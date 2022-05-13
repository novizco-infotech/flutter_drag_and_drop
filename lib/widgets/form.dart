



import 'package:draganddrop1/model/ListModel.dart';
import 'package:draganddrop1/model/dragList.dart';
import 'package:draganddrop1/provider/DragCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/draggableList.dart';



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
  // var editListData =
  //     ListModel(name: '', Description: '', job: '');
  @override
  void dispose() {
    DateFocasNode.dispose();
    descriptionFocusNode.dispose();

    super.dispose();
  }

  void saveForm() {
    form.currentState!.save();
    // print(editListData.name);
    final name=NameController.text;
    final des=DescriptionController.text;
    final job=DateController.text;
  //  final card1= Provider.of<DragCard>(context,listen: false).AddProduct(editListData);
  Provider.of<DataProvider>(context,listen: false).addProduct(name, des, job);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
         padding: const EdgeInsets.all(16.0),
        child: Form(
          key: form,
          child:  Column(
              children: [
                TextFormField(
                  controller: NameController,
                  decoration: const InputDecoration(hintText: 'Enter Name'),
                  
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(DateFocasNode);
                  },
                  // onSaved: (value) {
                  //   editListData = ListModel(
                  //       name: value!,
                  //       Description: editListData.Description,
                  //       job: editListData.job);
                  // },
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
                  // onSaved: (value){
                  //   editListData=ListModel(name: editListData.name, Description: value!, 
                  //   job: editListData.job);
                  // },
                ),
                TextFormField(
                  controller: DescriptionController,
                  decoration: const InputDecoration(hintText: 'Description'),
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  focusNode: descriptionFocusNode,
                  onFieldSubmitted: (value) => saveForm(),
                  onSaved: (value){
                  //   editListData=ListModel(name:editListData.name ,
                  //    Description: editListData.Description,
                  //    job: value! 
                  //    );
                  // },
  }),
              ],
            ),
          
        ),
      ),
      title: const Center(
        child: Text('Add Details',style: TextStyle(
         fontWeight: FontWeight.bold,
         color: Colors.blueGrey
        ),),
      ),
      actions: [
        TextButton(onPressed: (){
          saveForm();
          Navigator.of(context).pop();
        }, child: Text('save')),
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text('Cancel'))
      ],
    );
  }
}

