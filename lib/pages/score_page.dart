import 'package:flutter/material.dart';
import 'landing_page.dart';


class ScorePage extends StatelessWidget{

  final int _score , _numQuestion;

  ScorePage(this._score,this._numQuestion);

  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.blueAccent,

//        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>  new LandingPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new Text("Here is your score dummmy", style: new TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
            new Text(_score.toString() +"/" + _numQuestion.toString(), style: new TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
            new IconButton(
                icon: new Icon(Icons.arrow_right),
                color: Colors.white,
                iconSize: 50.0,
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) =>  new LandingPage()),(Route route) => route == null),
            ),

          ],
        ),
      );

  }
}