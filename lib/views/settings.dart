// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:messagerie_app/helper/helper_functions.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () async {
          // FilePickerResult? result = await FilePicker.platform.pickFiles();

          // if (result != null) {
          //   final file = result.files.first;
          // } else {
          //   return;
          // }
        },
      ),
      body: ImageUpload(),
    );
  }
}

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  Uint8List? bytesData;
  String? chemeinUrl;
  String? nameFile;
  String? imageUrl;

  picker() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.image,
    );
    if (filePickerResult != null) {
      setState(() {
        bytesData = filePickerResult.files.first.bytes;
        nameFile = filePickerResult.files.first.name;
        if (bytesData != null) {
          Showdialog();
        }
      });
    }
  }

  Showdialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          if (Platform.isIOS) {
            return CupertinoAlertDialog(
              title: Text(
                  "Souhaiter enregistrer cette image comme photo de profil?"),
              content: Image.memory(bytesData!),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Annuler")),
                ElevatedButton(onPressed: () {}, child: Text("Ok")),
              ],
            );
          } else {
            return AlertDialog(
              title: Text("Souhaiter enregistrer cette image ?"),
              content: Image.memory(bytesData!),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Annuler")),
                ElevatedButton(
                    onPressed: () {
                      HelperFunctions.storageUserImage(
                              HelperFunctions.getUidOfCurrentUser(), bytesData!)
                          .then((value) {
                        setState(() {
                          imageUrl = value;
                        });
                      });

                      Navigator.pop(context);
                    },
                    child: Text("Ok")),
              ],
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    // backgroundColor: Colors.white;,
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          'Mon profil',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2, 2),
                    spreadRadius: 2,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: (imageUrl != null)
                  ? Image.network(imageUrl!)
                  : Image.network('https://i.imgur.com/sUFH1Aq.png')),
          SizedBox(
            height: 20.0,
          ),
          Material(
            color: Colors.blue,
            // color: Colors.blue,
            // padding: const EdgeInsets.all(10),

            child: InkWell(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text("Changer sa photo de profil",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              onTap: () {
                picker();
              },
              splashColor: Color.fromARGB(255, 0, 90, 163),
              highlightColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
