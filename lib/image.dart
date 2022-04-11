import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/button.dart';
import 'package:image_picker/image_picker.dart';


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


