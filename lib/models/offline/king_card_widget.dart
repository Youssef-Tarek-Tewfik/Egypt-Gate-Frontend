import 'package:egypt_gate/common/navigation.dart';
import 'package:egypt_gate/screens/king_screen.dart';
import 'package:flutter/material.dart';


class KingCard extends StatefulWidget {
  final String kingName;
  final String reignPeriod;
  final String dynasty;
  final String history;

  const KingCard({
    this.kingName,
    this.reignPeriod,
    this.dynasty,
    this.history
  });

  @override
  _KingCardState createState() => _KingCardState();
}

class _KingCardState extends State<KingCard> {

  @override
  void initState() {
    super.initState();
  }

  void tapHandler(BuildContext context) {
    Navigator.push(
      context,
      // customNavigation(
      //   KingScreen(
      //     kingName: widget.kingName,
      //     reignPeriod: widget.reignPeriod,
      //     dynasty: widget.dynasty,
      //     history: widget.history,
      //   )
      // )
      MaterialPageRoute(
        builder: (context) => KingScreen(
          kingName: widget.kingName,
          reignPeriod: widget.reignPeriod,
          dynasty: widget.dynasty,
          history: widget.history,
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => tapHandler(context),
      child: Material(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(3.5),
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(56, 37, 14, 20), width: 1.4),
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: AssetImage("assets/images/pattern6.jpg"),
              fit: BoxFit.cover
            ),
          ),
          height: 200,
          child: Row(
            children: [
              Container(
                margin: new EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/${widget.kingName}.jpg",
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
