
import './widgets/TransactionList.dart';
import 'package:Xpence/widgets/new_transaction.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpence',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.orange[200],
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith()),
      ),
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
 // String TitleInput;
 // String AmountInput;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController=TextEditingController();

  final amountController=TextEditingController();
    final List<Transaction> _userTransactions=[
      Transaction( 
           id:'t1',
           title:'clothes', 
           amount: 99,
           date: DateTime.now()  
           ), 
      Transaction  (
            id:'t2' ,
            title:'groceries' ,
            amount: 567,
            date: DateTime.now() 
            )
            ];
  void _addNewTransaction(String txTitle, int txamount){
      final newtx=Transaction(
      title: txTitle,
      amount: txamount,
      date: DateTime.now(), 
     );
 
 
  setState(() {
    _userTransactions.add(newtx);
  });
  }
  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx , builder: (bctx){
      return GestureDetector(
        onTap: (){},
        child: NewTransaction(_addNewTransaction),
        behavior:HitTestBehavior.opaque ,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //backgroundColor: Colors.pink[900],
      title: Text('Xpence'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
          ),
      ],
      ),
      
      body: Column(
      
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(color: Theme.of(context).primaryColor,
            child: Text('Chart!'),
            elevation: 5,

          ),
        ),
        TransactionList(_userTransactions),
      ],
      
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat ,
      floatingActionButton: FloatingActionButton(
      child:Icon(Icons.add),
      onPressed:()=>_startAddNewTransaction(context) ,
      ),
    );
    
  }
}

 



