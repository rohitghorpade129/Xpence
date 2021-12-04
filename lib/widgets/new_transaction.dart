import 'package:Xpence/widgets/TransactionList.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NewTransaction extends StatefulWidget {
final Function addtx;
NewTransaction(this.addtx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
final _titleController=TextEditingController();

final _amountController=TextEditingController();
var _selectedDate;
  void _submit(){
    
      final ti=_titleController.text;
      final am=double.parse(_amountController.text);

      if(ti.isEmpty || am<=0){
        return;
      }
      widget.addtx(ti,am);
      Navigator.of(context).pop();
  }

  void _presentDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019), 
      lastDate: DateTime.now(),
      ).then((picked_date){
          if(picked_date==null){
            return ;
          }
        setState(() {
          _selectedDate=picked_date;
        });
        
          
      });
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
                  
                  controller: _titleController,
                  onSubmitted: (_)=>_submit(),
                  ),
                TextField(
                  decoration: InputDecoration(labelText:'Amount' ),
                  
                  controller: _amountController,
                  onSubmitted: (_)=>_submit(),
                  ),
                  Row(
                  
                    children:<Widget>[
                      Expanded(child: Text(_selectedDate==null?'no date chosen':'picked Date${DateFormat.yMd().format(_selectedDate)}' )),
                       FlatButton(
                         textColor: Theme.of(context).primaryColor,
                         child: Text('choose Date',
                         style:TextStyle(
                           color: Colors.red,
                           fontWeight: FontWeight.bold,
                         ) ,
                         ),
                          onPressed:_presentDatePicker, 
                          ),
                    ]
                   
            ),
                  RaisedButton(
                    
                   child: Text("ADD"),
                   color:Colors.red,
                   textColor: Theme.of(context).textTheme.button.color,
                   onPressed:(){
                      _submit();
                    },
                   )
                   
              ],
            ),
          ),
          
            elevation: 5,
        );
        
  }
}