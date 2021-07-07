import 'package:flutter/material.dart';

ListTile languageTile(String leadingText, String imageName,
    BuildContext buildContext, Function changeLanguage) {
  return ListTile(
      leading: Text(
        leadingText,
        style: TextStyle(color: Colors.white),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow, width: 0.1),
        ),
        child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 29,
              minHeight: 29,
              maxWidth: 49,
              maxHeight: 49,
            ),
            child: Image.asset("assets/images/${imageName}.jpg",
                fit: BoxFit.cover)),
      ),
      onTap: () {
        changeLanguage(leadingText);
        Navigator.pop(buildContext);
      });
}
