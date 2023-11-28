import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sec9/pages/locl_storge.dart';
import 'package:sec9/pages/web_view_flutter_page.dart';

import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final imagePicker = ImagePicker();
  var imagePath;

  void pickImage() async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath = File(image.path);
      setState(() {});
    }
  }

  deleteImage() {
    imagePath = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MaterialButton(
              height: 50,
              minWidth: double.infinity,
              color: Colors.green,
              onPressed: pickImage,
              child: const Text(
                'Pick Image',
                style: TextStyle(fontSize: 30),
              ),
            ),
            MaterialButton(
              height: 50,
              minWidth: double.infinity,
              color: Colors.red,
              onPressed: deleteImage,
              child: const Text(
                'delete Image',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => WebViewFlutterPage()));
              },
              child: Text('youtube'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => LocalStorgePage()));
              },
              child: Text('Shared Pref'),
            ),
            SizedBox(height: 20),
            imagePath == null
                ? Text('havn\'t picked image')
                : Image.file(imagePath),
          ],
        ),
      ),
    );
  }
}
