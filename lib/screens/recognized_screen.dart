import 'package:egypt_gate/common/theme.dart';
import 'package:flutter/material.dart';

class RecognizedScreen extends StatefulWidget {

  final Function onClick;

  const RecognizedScreen ({Key key, this.onClick}) : super(key: key);

  @override
  _RecognizedScreenState createState() => _RecognizedScreenState();
}

class _RecognizedScreenState extends State<RecognizedScreen> {
  @override
  Widget build(BuildContext context) {

    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: w,
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.third, width: 1.4),
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
            image: AssetImage("assets/images/pattern6.jpg"),
            fit: BoxFit.cover),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: h * 0.25),
            Center(
              child: Text(
                "Recognition successful!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CustomColors.third,
                  fontFamily: "Lato Light",
                  fontWeight: FontWeight.w900,
                  fontSize: w * 0.1,
                ),
              ),
            ),
            SizedBox(height: h * 0.05),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Your AR scene is now ready!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CustomColors.third,
                    fontFamily: "Lato Light",
                    fontWeight: FontWeight.w500,
                    fontSize: w * 0.06,
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.2),
            Container(
              // margin: const EdgeInsets.only(right: 10),
              width: 0.6 * w,
              height: 0.15 * h,
              child: ElevatedButton(
                onPressed: widget.onClick,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(CustomColors.third),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Launch",
                      style: TextStyle(
                        color: CustomColors.primary,
                        fontFamily: "serif",
                        fontWeight: FontWeight.w700,
                        fontSize: w * 0.07,
                        letterSpacing: 1
                      ),
                    ),
                    SizedBox(width: w * 0.015),
                    Icon(
                      Icons.arrow_forward,
                      // Icons.arrow_back_ios,
                      size: w * 0.1,
                      color: CustomColors.primary,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}