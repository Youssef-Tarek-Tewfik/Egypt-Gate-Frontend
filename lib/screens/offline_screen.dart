import 'package:egypt_gate/models/offline/king_card_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class OfflineScreen extends StatefulWidget {
  @override
  _OfflineScreenState createState() => _OfflineScreenState();
}

class _OfflineScreenState extends State<OfflineScreen> {

  List<String> _names = [];
  List<String> _reigningPeriods = [];
  List<String> _dynasties = [];
  List<String> _histories = [];

  void fetchNames() async {
    final responseText = await rootBundle.loadString('assets/descriptions/names.txt');

    setState(() {
      _names = responseText.split('\n');
    });

    for (var name in _names) {
      fetchFlatInfo(name);
    }
  }

  void fetchFlatInfo(String nameIn) async {
    nameIn = nameIn.substring(0, nameIn.length - 1);
    final responseData = await rootBundle.loadString('assets/descriptions/$nameIn.txt');

    setState(() {
      final data = responseData.split('\n');
      _reigningPeriods.add(data[0]);
      _dynasties.add(data[1]);
      _histories.add(data[2]);
    });
  }

  List<Widget> _getCards() {
    List<Widget> cards = [];
    for (int i = 0; i < _names.length - 1; i++) {
      cards.add(KingCard(
        kingName: _names[i].trimRight(),
        reignPeriod: _reigningPeriods[i],
        dynasty: _dynasties[i],
        history: _histories[i],
      ));
    }
    print(_dynasties.length);
    return cards;
  }

  @override
  void initState() {
    super.initState();
    fetchNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView(
            children: _getCards(),
          )
        ),
      ),
    );
  }
}
