import 'package:flutter/material.dart';

class KingDetailsScreen extends StatefulWidget {
  const KingDetailsScreen({Key key}) : super(key: key);

  @override
  _KingDetailsScreenState createState() => _KingDetailsScreenState();
}

class _KingDetailsScreenState extends State<KingDetailsScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;


    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          collapsedHeight: 100,
          pinned: true,
          snap: true,
          floating: true,
          backgroundColor: Colors.transparent,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("data"),
            background: Image.asset(
              "assets/images/Akhnaten.jpg",
              fit: BoxFit.fitWidth,
              alignment: Alignment.centerRight,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 1000,
            color: Colors.orange,
            child: Center(
              child: Text('Scroll to see the SliverAppBar in effect.'),
            ),
          ),
        ),

        // Center(
        //   child: Column(
        //     children: [
        //       Image.asset("assets/images/Akhnaten.jpg", height: 280, fit: BoxFit.fitHeight),
        //       SizedBox(height: 40,),
        //       Text("data")
        //     ],
        //   ),
        // ),
      ]
    );
  }
}