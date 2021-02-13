import 'package:flutter/material.dart';
import 'package:redux_login/src/widget/custom_painter.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        child: Center(
          child: Text('Some Content', style: TextStyle(fontSize: 50.0)),
        ),
      ),
      Positioned(
        bottom: 0,
        left: 0,
        child: Container(
          child: Container(
            width: size.width,
            height: 100.0,
            child: Stack(children: <Widget>[
              CustomPaint(
                size: Size(size.width, 100.0),
                painter: BNBCustomPainter(),
              ),
              Center(
                heightFactor: 0.6,
                child: FloatingActionButton(
                  backgroundColor: Colors.orange,
                  onPressed: () {},
                  child: Icon(
                    Icons.shopping_basket_outlined,
                    size: 35.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                width: size.width,
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  IconButton(icon: Icon(Icons.home), onPressed: null),
                  IconButton(icon: Icon(Icons.restaurant_menu), onPressed: null),
                  Container(width: size.width*0.20,),
                  IconButton(icon: Icon(Icons.bookmark), onPressed: null),
                  IconButton(icon: Icon(Icons.notifications), onPressed: null),

                ],),
              )
            ]),
          ),
        ),
      )
    ]));
  }
}
