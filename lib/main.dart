

import 'package:flutter/material.dart';

import './widgets/user_transaction.dart';

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
  
 // String TitleInput;
 // String AmountInput;
  final titleController=TextEditingController();
  final amountController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Xpence'),
      ),
      
      body: Column(
      //mainAxisAlignment:MainAxisAlignment.spaceAround ,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(color: Colors.blue,
            child: Text('Chart!'),
            elevation: 5,

          ),
        ),
        UserTransactions()
      ],
      )
    );
    
  }
}

