

import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import './widgets/TransactionList.dart';
import 'package:Xpence/widgets/new_transaction.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import './widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpence',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.orange[600],
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          subtitle1: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          button: TextStyle(
            color: Colors.white,
          )
          ),
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(
          subtitle1: TextStyle(fontFamily: 'OpenSans',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          ),
          )
          ),
      ),
      home:MyHomePage(),
      debugShowCheckedModeBanner: false,
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
     
            ];
   bool _showChart=false;

  List<Transaction> get recentTransactions{
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days:7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txamount, DateTime chosenDate){
      final newtx=Transaction(
      title: txTitle,
      amount: txamount,
      date:chosenDate,
      id: DateTime.now().toString(),
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
   
   void deleteTransaction(String id){
      setState(() {
        _userTransactions.removeWhere((tx)=> tx.id==id);
        
      });
   }


  @override
  Widget build(BuildContext context) {
      final bool IsLandscape =MediaQuery.of(context).orientation==Orientation.landscape;
      final appBar= AppBar(
      //backgroundColor: Colors.pink[900],
      title: Text('Xpence'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
          ),
      ],
      );
      final txListWidget= Container(
            height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top)*0.7,
            child: TransactionList(_userTransactions,deleteTransaction));
      return Scaffold(
        appBar: appBar,
      body: SingleChildScrollView(
        
        child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if(IsLandscape ) Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('show chart'),
            Switch (value: _showChart, onChanged:(val){
              setState(() {
                _showChart=val;
              });
            }, ),
          ],),
          if(!IsLandscape) Container(
            height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top)*0.3,
            child: Chart(recentTransactions)
            ),
            if(!IsLandscape) txListWidget,
            if(IsLandscape) _showChart? Container(
            height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top)*0.85,
            child: Chart(recentTransactions)
            ):
            txListWidget,

          
        ],
        
        ),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat ,
      floatingActionButton: FloatingActionButton(
      child:Icon(Icons.add),
      onPressed:()=>_startAddNewTransaction(context) ,
      ),
    );
    
  }
}

 



