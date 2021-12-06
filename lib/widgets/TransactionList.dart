

import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final Function deletetx;
  
  TransactionList(this.transactions,this.deletetx);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty ?
      LayoutBuilder(builder:(ctx,constraints){
        return Column(
        children: <Widget>[
          Text(
            'No transactions Added',
            style:Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: constraints.maxHeight*0.6 ,
            child: Image.asset(
              'assets/images/waiting.png',
            ),
          ),
        ],
        );
      }): 
      ListView.builder(
      itemBuilder:(ctx,index){
        
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          elevation: 5,
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(2),
                child: FittedBox(
                  child: Text('₹${transactions[index].amount.toInt()}'
                  )
                  ),
              ),
              ),
            title: Text(
              transactions[index].title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)
            ),
            trailing: IconButton(icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            onPressed:()=>deletetx(transactions[index].id),
            ),
          ),
        );
          
      } ,
      itemCount: transactions.length,
      
      );

}
}