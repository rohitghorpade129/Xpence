import 'package:flutter/Material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
            children: transactions.map((tx){
              return Card(
                child:Row(
                   children:<Widget> [
                     Container(margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                       child: Text(
                         '₹'+tx.amount.toString(),
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 20,
                         color: Colors.pink[900],
                         ),
                       ),
                       decoration: BoxDecoration(
                         border:Border.all(
                           color: Colors.pink[900],
                           width: 2,

                       )
                        ),
                        padding: EdgeInsets.all(10),
                       ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:<Widget> [
                         Text(tx.title,
                         style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 18,
                         color: Colors.black87,
                         ),
                         ),
                         Text(
                         DateFormat('dd MMM, yyyy').format(tx.date),
                         style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 16,
                         color: Colors.grey,
                         ),
                         ),
                       ],
                       )
                   ],
                  ),
              ); 
              
            }).toList(),
          );
  }
}