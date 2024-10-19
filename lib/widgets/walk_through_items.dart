import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;
import 'package:strangerschat/models/Slider_objects.dart';

class SlideItem extends StatelessWidget {
  final int index;

  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: MediaQuery.of(context).size.height * 0.14,
        left: MediaQuery.of(context).size.width * 0.13,
        // right: 10,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.50,
          // width: 323,
          alignment: Alignment.center,
          child: Image(
            image: AssetImage(slideList[index].imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.48),
        alignment: Alignment.center,
        child: Text(
          slideList[index].title,
          textAlign: TextAlign.center,
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w700,
            fontSize: 36,
            color: Colors.white,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.65,
            left: MediaQuery.of(context).size.width * 0.08,
            right: MediaQuery.of(context).size.width * 0.08),
        alignment: Alignment.center,
        child: Text(
          slideList[index].content,
          textAlign: TextAlign.center,
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    ]);
  }
}

//Custom Painter for the bottom curve
class BottomCurve extends CustomPainter {
  final LinearGradient gradient;
  BottomCurve({required this.gradient});
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height;
    final paint = Paint();
    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, w, h));
    paint.color = Colors.black;
    canvas.drawPath(mainBackground, paint);

    // ignore: non_constant_identifier_names
    Path BottomOval = Path();
    BottomOval.moveTo(0, h * 0.76); //Start point from 80% of the height
    BottomOval.quadraticBezierTo(w * 0.2, h * 0.675, w * 0.5,
        h * 0.67); //From left side to middle of the screen
    BottomOval.quadraticBezierTo(
        w * 0.8, h * 0.675, w, h * 0.76); // From centre to right side
    BottomOval.lineTo(w, h);
    BottomOval.lineTo(0, h);
    paint.shader = ui.Gradient.linear(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      [
        const Color(0xff2e2c2c),
        const Color(0x382e2c2c),
      ],
    );
    canvas.drawPath(BottomOval, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
