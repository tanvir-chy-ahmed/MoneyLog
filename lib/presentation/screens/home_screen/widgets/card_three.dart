import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneylog/presentation/themes/colors.dart';

import '../../../themes/theme.dart';

class CardThree extends StatelessWidget {
  String img;
  String text;
  int budget;
  Color color;

  CardThree({
    super.key,
    required this.text,
    required this.budget,
    required this.img,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.46.w,
      height: MediaQuery.of(context).size.height * 0.15.h,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.r),
            border: Border.all(
              color: Colors.white.withOpacity(0.10),
              width: 0.8.w,
            ),

            color: Color(0xFF171616),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xFF2a2a2a), // Replaced 0xFF342b30
                    ),
                    child: Icon(
                      Icons.add, // Specific icon from snippet
                      color: colors.marketUp,
                    ),
                  ),

                  Text(
                    "16%",
                    style: GoogleFonts.roboto(
                      color: Colors.grey,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                "Macbook Air",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: colors.textMain,
                ),
              ),
              Spacer(),
              Text(
                "\$479.5 left",
                style: GoogleFonts.roboto(color: Colors.grey, fontSize: 16.sp),
              ),

              Spacer(),

              LinearProgressIndicator(
                value: 0.4,

                backgroundColor: Colors.grey.withOpacity(0.3),
                valueColor: AlwaysStoppedAnimation<Color>(colors.marketUp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
