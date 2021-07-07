import 'package:egypt_gate/common/theme.dart';
import 'package:egypt_gate/models/home/languageTiles.dart';
import 'package:flutter/material.dart';

SimpleDialog languageDialog(BuildContext context, Function changeLanguage) {
  return SimpleDialog(
    backgroundColor: Colors.black,
    shape: ContinuousRectangleBorder(
        side: BorderSide(color: CustomColors.primary, width: 1.4),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    title:
        const Text('Choose a language', style: TextStyle(color: Colors.white)),
    children: <Widget>[
      SimpleDialogOption(
          onPressed: () {},
          child: languageTile("Arabic", "Arabic", context, changeLanguage)),
      SimpleDialogOption(
          onPressed: () {},
          child: languageTile("English", "English", context, changeLanguage)),
      SimpleDialogOption(
          onPressed: () {},
          child: languageTile("Spanish", "Spanish", context, changeLanguage)),
      SimpleDialogOption(
          onPressed: () {},
          child: languageTile("Russian", "Russian", context, changeLanguage)),
      SimpleDialogOption(
          onPressed: () {},
          child: languageTile("French", "French", context, changeLanguage)),
      SimpleDialogOption(
          onPressed: () {},
          child: languageTile("German", "German", context, changeLanguage)),
    ],
  );
}
