import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: selectimage(),
    );
  }
}

class selectimage extends StatefulWidget {
  const selectimage({Key? key}) : super(key: key);

  @override
  State<selectimage> createState() => _selectimageState();
}

class _selectimageState extends State<selectimage> {
  File? image;
  Future pickimage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final temp = File(image.path);
      print(image.path + " IMage bytes " + image.readAsBytes().toString());
      setState(() {
        this.image = temp;
      });
    } on PlatformException catch (e) {
      print("$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                btn(
                  text2: "first",
                  ontap: () {
                    setState(() {
                      selected = "first";
                    });

                    print("object");
                  },
                  text: "Select/ Upload/ Image",
                ),
                btn(
                  text2: "first1",
                  ontap: () {
                    setState(() {
                      selected = "first1";
                    });

                    print("object");
                  },
                  text: "Reverse image search result",
                ),
                btn(
                  text2: "first2",
                  ontap: () {
                    setState(() {
                      selected = "first2";
                    });

                    print("object");
                  },
                  text: "Saved Result",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                btn(
                  text2: "first3",
                  ontap: () {
                    pickimage();
                    setState(() {
                      selected = "first3";
                    });

                    print("object");
                  },
                  text: "Select Image/",
                ),
                btn(
                  text2: "first4",
                  ontap: () {
                    setState(() {
                      selected = "first4";
                    });

                    print("object");
                  },
                  text: "Upload Select Area ",
                ),
              ],
            ),
            image != null
                ? Image.file(
                    image!,
                    height: size.height * 0.5,
                    width: size.width * 0.8,
                  )
                : Text("Image")
          ],
        ),
      ),
    );
  }
}

var selected = "first";

class btn extends StatelessWidget {
  String? text = "";

  var ontap;

  Object text2;

  btn({
    required this.text2,
    this.ontap,
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.height / 100),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: selected == text2 ? Colors.blue : Colors.black,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
              // gradient: const LinearGradient(
              // colors: [Colors.black, Colors.greenAccent]),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    offset: Offset(2.0, 2.0))
              ]),
          child: Center(
            child: Text(
              text.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Open Sans',
                  fontSize: 20,
                  letterSpacing: 1),
            ),
          ),
        ),
      ),
    );
  }
}
