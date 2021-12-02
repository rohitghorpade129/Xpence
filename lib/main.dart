
import 'package:flutter/material.dart';
import './transaction.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpence',
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List <Transaction>transactions=[
    Transaction(
    id:'t1',
    title:'clothes',
    amount: 99,
    date: DateTime.now()
    ),
    Transaction(
    id:'t2',
    title:'groceries',
    amount: 567,
    date: DateTime.now()
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Xpence'),
      ),
      
      body: Column(mainAxisAlignment:MainAxisAlignment.spaceAround ,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(color: Colors.blue,
            child: Text('Chart!'),
            elevation: 5,

          ),
        ),
        Column(
            children: transactions.map((tx){
              return Card(
                child:Row(
                   children:<Widget> [
                     Container(margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                       child: Text(tx.amount.toString(),
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
                         Text(tx.date.toString(),
                         style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 16,
                         color: Colors.grey,
                         ),),
                       ],)
                   ],
                  ),
              ); 
              
            }).toList(),
          )
      ],
      )
    );
    
  }
}

