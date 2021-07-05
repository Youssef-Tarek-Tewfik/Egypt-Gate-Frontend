import 'package:flutter/material.dart';

class king_info extends StatelessWidget {
  String kingName = "";
  String reignPeriod = "";
  String dynasty = "";
  String history = "";

  king_info(
      {@required this.kingName,
      @required this.reignPeriod,
      @required this.dynasty,
      this.history});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(3.5),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(56, 37, 14, 20), width: 1.4),
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
              image: AssetImage("assets/images/pattern6.jpg"),
              fit: BoxFit.cover),
        ),
        height: h,
        width: w,
        // color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Row(
              children: [
                Container(
                  margin: new EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/${kingName}.jpg",
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
                          kingName,
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
                        reignPeriod,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(56, 37, 14, 20),
                            fontFamily: 'WeissInitialen'),
                      ),
                      Text(
                        dynasty,
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
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      history,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(56, 37, 14, 20),
                          fontFamily: 'Lato Light'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
