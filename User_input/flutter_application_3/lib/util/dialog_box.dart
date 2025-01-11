// ignore_for_file: sized_box_for_whitespace, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_application_3/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({super.key, 
  required this.controller,
  required this.onSave,
  required this.onCancel
          });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //get user input
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter Task',
              border: OutlineInputBorder(),
            ),
          ),


          //buttons -> save+cancel
          Row(
            children: [
              //save button
              MyButton(text: "Save", onPressed: onSave),

              const SizedBox(width: 4), //space beetween buttons

              //cancel button
              MyButton(text: "Cancel", onPressed: onCancel),
            ],
          )
        ],)

      )
    );
  }
}