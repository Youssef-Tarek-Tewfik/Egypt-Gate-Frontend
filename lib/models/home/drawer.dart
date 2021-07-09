import 'package:egypt_gate/common/navigation.dart';
import 'package:egypt_gate/common/theme.dart';
import 'package:egypt_gate/models/home/language_dialog.dart';
import 'package:egypt_gate/screens/offline_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';


Drawer customDrawer({
  final BuildContext context,
  final String language,
  final Function changeLanguage,
  final Function getGalleryImage,
  final bool connected,
  }) {

  void languageTapHandler() {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (buildContext) {
        return languageDialog(buildContext, changeLanguage);
      }
    );
  }

  void galleryTapHandler() {
    Navigator.pop(context);
    getGalleryImage();
  }

  void valleyTapHandler() {
    // Navigator.pop(context);
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => OfflineScreen()));
    Navigator.pop(context);
    Navigator.of(context).push(customNavigation(OfflineScreen()));
  }

  return Drawer(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black,
        // color: CustomColors.third,
        border: Border(
            right: BorderSide(color: CustomColors.primary, width: 1.4),
            top: BorderSide(color: CustomColors.primary, width: 1.4),
            bottom: BorderSide(color: CustomColors.primary, width: 1.4)),
      ),
      child: ListView(
        children: [
          ListTile(
            title: Text(
              "Language",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            trailing: Container(
              margin: EdgeInsets.only(right: 6.7),
              decoration: BoxDecoration(
                border: Border.all(color: CustomColors.primary, width: 0.1),
              ),
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 19,
                    minHeight: 24,
                    maxWidth: 49,
                    maxHeight: 24,
                  ),
                  child: Image.asset("assets/images/$language.jpg",
                      fit: BoxFit.cover)),
            ),
            onTap: () => languageTapHandler(),
          ),
          SizedBox(height: 15),
          ListTile(
            enabled: connected,
            trailing: Container(
              margin: const EdgeInsets.only(right: 5.5),
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 19,
                    minHeight: 19,
                    maxWidth: 39,
                    maxHeight: 39,
                  ),
                  child: Image.asset(
                    "assets/images/imageIcon.png",
                    fit: BoxFit.cover,
                    color: connected? Colors.green: Colors.grey,
                  )
                ),
            ),
            title: Text(
              "Scan from gallery",
              style: TextStyle(
                color: connected? Colors.white: Colors.grey,
                fontSize: 20
              )
            ),
            onTap: () => galleryTapHandler(),
          ),
          SizedBox(height: 15),
          ListTile(
            title: Text("Kings & Queens Valley",
              style: TextStyle(fontSize: 20, color: Colors.white)),
            trailing: Container(
              margin: EdgeInsets.only(right: 5.2),
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 29,
                    minHeight: 29,
                    maxWidth: 49,
                    maxHeight: 49,
                  ),
                  child: Image.asset("assets/images/crown2.png",
                      fit: BoxFit.cover)),
            ),
            onTap: () => valleyTapHandler(),
          )
        ],
      ),
    ),
  );
}
