import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBox extends StatefulWidget {
  const GlassBox({Key? key, this.text}) : super(key: key);
  final text;
  @override
  State<GlassBox> createState() => _GlassBoxState();
}

class _GlassBoxState extends State<GlassBox> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 25,
        width: double.infinity,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.white.withOpacity(0.2),
                // ),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.05),
                      Colors.white.withOpacity(0.05)
                    ]),
              ),
              child: Center(
                child: Text(
                  widget.text,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
