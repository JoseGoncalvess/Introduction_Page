import 'package:flutter/material.dart';

class CardInfoWidget extends StatefulWidget {
  final String titulo;
  final String texto;
  final String img;
  final int index;
  const CardInfoWidget(
      {super.key,
      required this.titulo,
      required this.texto,
      required this.img,
      required this.index});

  @override
  State<CardInfoWidget> createState() => _CardInfoWidgetState();
}

class _CardInfoWidgetState extends State<CardInfoWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Image.asset(widget.img)),
        SizedBox(
          height: height * 0.1,
        ),
        AnimatedContainer(
          height: height * 0.14,
          curve: Curves.easeInToLinear,
          duration: Duration(milliseconds: 300),
          child: Column(
            children: [
              Text(
                widget.titulo,
                style: TextStyle(
                    fontSize: width * 0.07, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(widget.texto,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF5A0F8F),
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.1,
        ),
      ],
    );
  }
}
