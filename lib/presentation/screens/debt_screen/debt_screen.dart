import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneylog/presentation/screens/debt_screen/widgets/debt_card.dart';
import 'package:moneylog/presentation/themes/colors.dart';

import '../../themes/theme.dart';

class DebtScreen extends StatefulWidget {
  const DebtScreen({super.key});

  @override
  State<DebtScreen> createState() => _DebtScreenState();
}

class _DebtScreenState extends State<DebtScreen> {
  bool empty = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Container(
      color: colors.bgApp,
      child: SafeArea(
        child: Column(
          children: [
            //  AppBar
            PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight + 10.h),
              child: AppBar(
                backgroundColor: colors.bgApp,
                elevation: 0,
                automaticallyImplyLeading: false,
                // Prevents accidental back buttons
                titleSpacing: 5,
                title: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "Debts & Loans",
                        style: GoogleFonts.inter(
                          color: colors.textMain,
                          fontSize: 22.sp,
                          fontWeight: .bold,
                        ),
                      ),

                      const SizedBox(height: 3),

                      Text(
                        "Track your payoff progress",
                        style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontSize: 15.sp,
                          fontWeight: .w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Scrollable Content\
            empty
                ? Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        // Centers the column vertically
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: Colors.grey,
                            size: 50.sp,
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            "No Debts Recorded",
                            style: GoogleFonts.inter(
                              color: Colors.grey,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      // Removed the large top padding since it's no longer overlapping
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        spacing: 5,
                        mainAxisAlignment: .start,
                        crossAxisAlignment: .start,
                        children: [
                          DebtCard(),
                          DebtCard(),
                          DebtCard(),
                          DebtCard(),
                          DebtCard(),
                          DebtCard(),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
