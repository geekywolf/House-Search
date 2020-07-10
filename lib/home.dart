import 'package:flutter/material.dart';
import 'package:househunt/utils/firebase_auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(title: Text("Logged In"),
        ),
        body: Column(
          children: <Widget>[
            Container(
            child: Text("Home Page"),
      ),
      RaisedButton(
        child:Text("Logout"),
        onPressed:(){
          AuthProvider().logOut();
        } ),
          ],
        ),
    );
  }
}