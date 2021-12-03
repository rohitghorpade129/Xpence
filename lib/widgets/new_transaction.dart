import 'package:Xpence/widgets/TransactionList.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
final Function addtx;
NewTransaction(this.addtx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
final titleController=TextEditingController();

final amountController=TextEditingController();

  void submit(){
    
      final ti=titleController.text;
      final am=int.parse(amountController.text);

      if(ti.isEmpty || am<=0){
        return;
      }
      widget.addtx(ti,am);
      Navigator.of(context).pop();
  }

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
                  
                  controller: titleController,
                  onSubmitted: (_)=>submit(),
                  ),
                TextField(
                  decoration: InputDecoration(labelText:'Amount' ),
                  
                  controller: amountController,
                  onSubmitted: (_)=>submit(),
                  ),
                  FlatButton(
                    
                   child: Text("ADD"),
                   textColor:Colors.pink[900],
                   onPressed:(){
                      submit();
                    },
                   )
                   
              ],
            ),
          ),
          
            elevation: 5,
        );
        
  }
}