import 'package:egypt_gate/common/theme.dart';
import 'package:egypt_gate/models/home/languageDialog.dart';
import 'package:egypt_gate/screens/offline_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

Drawer customDrawer(BuildContext buildContext, String language, Function changeLanguage){
return Drawer(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
            right: BorderSide(color: CustomColors.primary, width: 1.4),
            top: BorderSide(color: CustomColors.primary, width: 1.4),
            bottom: BorderSide(color: CustomColors.primary, width: 1.4)),
      ),
      child: ListView(
        children: [
          ListTile(
            leading: Text(
              "Scanning language",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                border: Border.all(color: CustomColors.primary, width: 0.1),
              ),
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 29,
                    minHeight: 29,
                    maxWidth: 49,
                    maxHeight: 49,
                  ),
                  child: Image.asset("assets/images/${language}.jpg",
                      fit: BoxFit.cover)),
            ),
            onTap: () {
              Navigator.pop(buildContext);
              showDialog(context: buildContext,builder: (buildContext){
                  return languageDialog(buildContext,changeLanguage);
              });
            },
          ),
          ListTile(
            title: Text("Scan from gallery",
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(buildContext);
            },
          ),
          ListTile(
            title: Text("Offline kings", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(buildContext);
              Navigator.push(buildContext,
                  MaterialPageRoute(builder: (context) => OfflineScreen()));
            },
          )
        ],
      ),
    ),
  );
  }

