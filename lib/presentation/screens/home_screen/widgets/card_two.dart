import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneylog/presentation/themes/colors.dart';

import '../../../themes/theme.dart';

class CardTwo extends StatelessWidget {
  String img;
  String text;
  int budget;
  Color color;

  CardTwo({
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
      width: MediaQuery.of(context).size.width * 0.30.w,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.r),
            border: Border.all(
              color: Colors.white.withOpacity(0.10),
              width: 0.8.w,
            ),

            color: Color(0xFF171616),
          ),
          // decoration: const BoxDecoration(color: Color(0xFF171616)),
          child: Column(
            spacing: 11,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(img, height: 20.h, width: 20.w),
                  Text(
                    text,
                    style: GoogleFonts.roboto(
                      color: color,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              Text(
                "\$$budget",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(
                  color: colors.textMuted,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
