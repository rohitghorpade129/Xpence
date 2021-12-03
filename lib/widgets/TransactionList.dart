import 'package:flutter/Material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height:300,
      child: ListView.builder(
      itemBuilder:(ctx,index){
        return Card(
          child:Row(
              children:<Widget> [
                Container(margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  child: Text(
                    '₹'+transactions[index].amount.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border:Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,

                  )
                  ),
                  padding: EdgeInsets.all(10),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget> [
                    Text(transactions[index].title,
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                    ),
                    ),
                    Text(
                    DateFormat('dd MMM, yyyy').format(transactions[index].date),
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
          
      } ,
      itemCount: transactions.length,
      
      ),
);
}
}