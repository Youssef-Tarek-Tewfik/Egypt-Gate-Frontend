import 'dart:io';

import 'package:egypt_gate/king_card_widget.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class offlineScreen extends StatefulWidget {
  @override
  _offlineScreenState createState() => _offlineScreenState();
}

class _offlineScreenState extends State<offlineScreen> {
  List<String> kingsNames = [];
  List<String> reigningPeriods = [];
  List<String> dynasties = [];
  List<String> histories = [];
  fetchNames() async {
    final responseText =
        await rootBundle.loadString('assets/descriptions/names.txt');
    setState(() {
      kingsNames = responseText.split('\n');
    });
    for (int i = 0; i < kingsNames.length - 1; i++) {
      fetchFlatInfo(kingsNames[i]);
    }
  }

  fetchFlatInfo(String nameIn) async {
    nameIn = nameIn.substring(0, nameIn.length - 1);
    final responseData =
        await rootBundle.loadString('assets/descriptions/${nameIn}.txt');
    setState(() {
      final data = responseData.split('\n');
      reigningPeriods.add(data[0]);
      dynasties.add(data[1]);
      histories.add(data[2]);
    });
  }

  List<Widget> _getCards() {
    List cards = List<Widget>();
    for (int i = 0; i < kingsNames.length - 1; i++) {
      cards.add(Kings_Card(
        kingName: kingsNames[i],
        // reignPeriod: "22e2",
        // dynasty: "3123123123",
        reignPeriod: reigningPeriods[i],
        dynasty: dynasties[i],
        history: histories[i],
      ));
    }
    print(dynasties.length);
    return cards;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: ListView(
          // children: [Kings_Card(kingName: kingsNames[2]),Text(kingsNames[1],textDirection: TextDirection.ltr,)],
          children: _getCards(),
        )),
      ),
    );
  }
}
