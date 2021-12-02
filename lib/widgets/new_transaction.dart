import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
final titleController=TextEditingController();
final amountController=TextEditingController();
final Function addtx;
NewTransaction(this.addtx);

  @override
  Widget build(BuildContext context) {
    return Card(
          child: Container(
            padding:EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  //onChanged: (val){
                    //TitleInput=val;

                  //},
                  controller: titleController,
                  ),
                TextField(
                  decoration: InputDecoration(labelText:'Amount' ),
                  //onChanged: (val){
                    //AmountInput=val;
                  //}
                  controller: amountController,
                  ),
                  FlatButton(
                    
                   child: Text("ADD"),
                   textColor:Colors.pink[900],
                   onPressed:(){
                      addtx(
                        titleController.text,
                        int.parse(amountController.text),
                        );
                    },
                   )
              ],
            ),
          ),
            elevation: 5,
        );
  }
}