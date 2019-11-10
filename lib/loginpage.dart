import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>{
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter email'
            ),
            onChanged: (value){
              this.email=value;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Password'
            ),
            onChanged: (value){
              this.password=value;
            },
          ),
          RaisedButton(
            onPressed: (){
              FirebaseAuth.instance.signInWithEmailAndPassword(email: this.email, password: this.password)
              .then((signedInUser){
                Navigator.of(context).pushReplacementNamed('/homepage');
                }).catchError((e){
                  print(e);
                });
            },
            textColor: Colors.white,
            child: Text('Login'),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}