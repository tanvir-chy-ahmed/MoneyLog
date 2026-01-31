import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/colors.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.bgApp,
      child: SafeArea(
        child: Column(
          children: [
            //  AppBar
            PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight + 10.h),
              child: AppBar(
                backgroundColor: MyColor.bgApp,
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
                        "Analytics",
                        style: GoogleFonts.inter(
                          color: MyColor.textMain,
                          fontSize: 22.sp,
                          fontWeight: .bold,
                        ),
                      ),

                      const SizedBox(height: 3),

                      Text(
                        "Visualize your financial health",
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
            Expanded(
              child: SingleChildScrollView(
                // Removed the large top padding since it's no longer overlapping
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  spacing: 5,
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: double.infinity,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16,
                            bottom: 0,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF171616),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.10),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header Row
                              Row(
                                children: [
                                  Text(
                                    "Monthly Spending",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: double.infinity,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16,
                            bottom: 0,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF171616),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.10),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header Row
                              Row(
                                children: [
                                  Text(
                                    "Category Breakdown",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    BottomAppBar(
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          "Export Data (CSV/PDF) - Coming Soon",
                          style: GoogleFonts.inter(
                            color: Colors.grey,
                            fontSize: 14.sp,
                            fontWeight: .w500,
                          ),
                        ),
                      ),
                    ),
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
