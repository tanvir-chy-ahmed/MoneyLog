import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/colors.dart';

class Datebox extends StatelessWidget {
  final int maxlength;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextNode;

  const Datebox({
    super.key,
    required this.maxlength,
    required this.controller,
    required this.focusNode,
    this.nextNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxlength == 4 ? 55.w : 30.w,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxlength),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
          contentPadding: EdgeInsets.zero,
        ),

        cursorColor: MyColor.marketUp,

        /// 🔵 AUTO SELECT FULL VALUE ON TAP
        onTap: () {
          controller.selection = TextSelection(
            baseOffset: 0,
            extentOffset: controller.text.length,
          );
        },

        /// ➡️ AUTO MOVE TO NEXT FIELD
        onChanged: (value) {
          if (value.length == maxlength && nextNode != null) {
            FocusScope.of(context).requestFocus(nextNode);
          }
        },
      ),
    );
  }
}
