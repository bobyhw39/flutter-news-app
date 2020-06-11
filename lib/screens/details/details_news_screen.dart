import 'package:flutter/material.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/screens/home/home_screen.dart';

class DetailsNewsScreen extends StatefulWidget {
  static const routeName = '/details';
  @override
  _DetailsNewsScreenState createState() => _DetailsNewsScreenState();
}

class _DetailsNewsScreenState extends State<DetailsNewsScreen> {
  @override
  Widget build(BuildContext context) {
    final Articles args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Image.network(args.urlToImage),
              Padding(
                padding: EdgeInsets.only(top: 15.0,left: 5.0),
                child:Text(args.title, style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0,left: 5.0),
                child: Text(args.description, style: TextStyle(fontSize: 17.0),),
              ),
            ],
          ),
        ),
      )
    );
  }
}
