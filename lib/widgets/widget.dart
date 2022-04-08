import 'package:flutter/material.dart';

PreferredSizeWidget? appBarMain(BuildContext context) {
  return AppBar(
    title: const Text("HeLol"),
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(
      color: Colors.white54,
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white60,
      ),
    ),
  );
}

TextStyle simpleTextStyle() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
}

TextStyle mediumTextStyle() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 17,
  );
}
