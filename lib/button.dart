import 'package:flutter/material.dart';

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