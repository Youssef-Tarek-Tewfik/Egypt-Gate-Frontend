import 'package:egypt_gate/common/theme.dart';
import 'package:flutter/material.dart';

class UnrecognizedScreen extends StatelessWidget {

  const UnrecognizedScreen ({Key key}) : super(key: key);

  void tapHandler(BuildContext context) {
    Navigator.of(context).pop();
  }

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
                "Unrecognized Statue",
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
                  "Sorry, we couldn't recognize this statue. Make sure to focus your camera on the statue's face while keeping your phone vertical!",
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
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(CustomColors.third),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  )
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_sharp,
                      // Icons.arrow_back_ios,
                      size: w * 0.1,
                      color: CustomColors.primary,
                    ),
                    SizedBox(width: w * 0.015),
                    Text(
                      "Try Again",
                      style: TextStyle(
                        color: CustomColors.primary,
                        fontFamily: "serif",
                        fontWeight: FontWeight.w700,
                        fontSize: w * 0.07,
                        letterSpacing: 1
                      ),
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