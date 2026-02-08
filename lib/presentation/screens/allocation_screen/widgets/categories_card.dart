import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../themes/theme.dart';

class CategoriesCard extends StatelessWidget {
  final int count;

  const CategoriesCard({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: .circular(22.r),
          border: Border.all(color: colors.primary, width: 1),
          gradient: LinearGradient(
            colors: [
              Color(0xFF18162a),
              Color(0xFF161422),
              Color(0xFF171525),
              Color(0xFF19162c),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  spacing: 15,
                  children: [
                    Container(
                      alignment: .center,
                      height: 30.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        color: colors.info,
                        borderRadius: .circular(8.r),
                      ),
                      child: Text(
                        count.toString(),
                        style: GoogleFonts.roboto(
                          fontSize: 22.sp,
                          fontWeight: .bold,
                          color: colors.textMain,
                        ),
                      ),
                    ),
                    Text(
                      "Essential",
                      style: GoogleFonts.roboto(
                        fontSize: 18.sp,
                        fontWeight: .bold,
                        color: colors.textMain,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "36 ${"%"}",
                      style: GoogleFonts.roboto(
                        fontSize: 26.sp,
                        fontWeight: .bold,
                        color: Color(0xff6c5dd3),
                      ),
                    ),
                    Text(
                      "35-40 ${"%"}",
                      style: GoogleFonts.roboto(
                        fontSize: 13.sp,
                        fontWeight: .bold,
                        color: colors.textMuted,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Text(
              "Basic Needs- Cover your 5-6k safely",
              style: GoogleFonts.roboto(
                fontSize: 14.sp,
                color: colors.textMuted,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "৳ 1804.68",
              style: GoogleFonts.roboto(
                fontSize: 20.sp,
                fontWeight: .bold,
                color: colors.textMain,
              ),
            ),
            SizedBox(height: 2),
            LinearProgressIndicator(
              value: 0.2,
              backgroundColor: Color(0xff25232c),
              minHeight: 5.h,
              color: colors.primary,
              borderRadius: BorderRadius.circular(12.r),
            ),

            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "7 subcategories ",
                    style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      color: colors.textMuted,
                    ),
                  ),
                  TextSpan(
                    text: " →",
                    style: GoogleFonts.roboto(
                      fontSize: 25.sp,
                      color: colors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
