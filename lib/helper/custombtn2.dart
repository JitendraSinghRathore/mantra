
import 'package:flutter/material.dart';

import '../utils/color_constant.dart';
import '../utils/constants.dart';
import 'getText.dart';

class CustomBtn2 extends StatefulWidget {
  final String title;
  final double height;
  final double width;
  final Color color;
  final bool isLoading;

  final Function() onTap;
  const CustomBtn2(
      {key,
      required this.title,
      required this.height,
      required this.width,
      required this.onTap,
      required this.color,
      this.isLoading = false});

  @override
  State<CustomBtn2> createState() => _CustomBtn2State();
}

class _CustomBtn2State extends State<CustomBtn2> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
           elevation: 0,
          backgroundColor: widget.isLoading ? ColorConstant.c3Color : widget.color,
          side: const BorderSide(
            width: 2.0,
            color: ColorConstant.buttonBorder,
          ),
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23,),
              )),

      onPressed: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        height: widget.height,
        width: widget.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.isLoading
                ? Container(
                    height: 24,
                    width: 24,
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: Colors.black87,
                    ),
                  )
                : Container(),
            getText(
                title: widget.title,
                size: 14,
                fontFamily: celiaBold,
                color: ColorConstant.blackColor,
                fontWeight: FontWeight.w700),
          ],
        ),
      ),
    );
  }
}
