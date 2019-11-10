import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/services/crud.dart';

class DashboardPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<DashboardPage>{
  String carModel;
  String carColor;

  crudMethods crudObj=new crudMethods();
  Future<bool> addDialog(BuildContext context) async{
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(
            'Add Data',
            style: TextStyle(
              fontSize: 15.0
            )
          ),
          content: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Car Name"
                ),
                onChanged: (value){
                  this.carModel=value;
                },
              ),
              SizedBox(height: 5.0,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Car Color"
                ),
                onChanged: (value){
                  this.carColor=value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Add'
              ),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.of(context).pop();
                Map carData={
                  'carName':this.carModel,
                  'color':this.carColor
                  };
                crudObj.addData(carData).then((result){
                  dialogTrigger(context);
                }).catchError((e){
                  print(e);
                });
              },
            )
          ],
        );
      }
    );
  }

  Future<bool> dialogTrigger(BuildContext context)async{
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Job Done',
          style: TextStyle(fontSize: 15.0)),
          actions: <Widget>[
            FlatButton(
              child: Text('All Right'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ]
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'dashboard'
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              addDialog(context);
            },
          )
        ],
      ),
    );
  }
}