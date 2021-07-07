import 'package:egypt_gate/screens/king_screen.dart';
import 'package:flutter/material.dart';

class Kings_Card extends StatefulWidget {
  String kingName = "";
  String reignPeriod = "";
  String dynasty = "";
  String history = "";

  Kings_Card(
      {@required this.kingName,
      @required this.reignPeriod,
      @required this.dynasty,
      this.history});

  @override
  _Kings_CardState createState() => _Kings_CardState();
}

class _Kings_CardState extends State<Kings_Card> {
  // void makeChange(){
  //   setState(() {
  //     widget.kingName = "Hello";
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    widget.kingName = widget.kingName.substring(0, widget.kingName.length - 1);

    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => KingScreen(
                      kingName: widget.kingName,
                      reignPeriod: widget.reignPeriod,
                      dynasty: widget.dynasty,
                      history: widget.history,
                    )));
      },
      child: Material(
        // color: Color.fromARGB(90, 255, 253, 201),
        color: Colors.black,
        child: Container(
          color: Colors.black,
          margin: EdgeInsets.all(3.5),
          decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromRGBO(56, 37, 14, 20), width: 1.4),
            borderRadius: BorderRadius.circular(15.0),
            // image: DecorationImage(
            //     image: AssetImage("assets/images/pattern6.jpg"),
            //     fit: BoxFit.cover),
          ),
          height: 200,
          // color: Colors.white,
          child: Row(
            children: [
              Container(
                margin: new EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/${widget.kingName}.jpg",
                    // "assets/images/Thutmose III.jpg",
                    fit: BoxFit.fitHeight,
                    height: 200,
                    width: 165,
                  ),
                ),
              ),
              Container(
                width: w * 0.54,
                height: h * 0.27,
                // color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        widget.kingName,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            // decoration: InputDecoration(border: InputBorder.none),
                            color: Color.fromRGBO(56, 37, 14, 20),
                            fontFamily: 'Cinzel'),
                      ),
                    ),
                    Text(
                      widget.reignPeriod,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(56, 37, 14, 20),
                          fontFamily: 'WeissInitialen'),
                    ),
                    Text(
                      widget.dynasty,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(56, 37, 14, 20),
                          fontFamily: 'WeissInitialen'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
