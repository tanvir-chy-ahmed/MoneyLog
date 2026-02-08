import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../themes/theme.dart';

class SettingsAllocationScreen extends StatefulWidget {
  const SettingsAllocationScreen({super.key});

  @override
  State<SettingsAllocationScreen> createState() =>
      _SettingsAllocationScreenState();
}

class _SettingsAllocationScreenState extends State<SettingsAllocationScreen> {
  TextEditingController incomeCtrl = TextEditingController();

  @override
  void dispose() {
    incomeCtrl.dispose();
    super.dispose();
  }

  double _sliderValue = 36;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      backgroundColor: colors.bgApp,

      // This centers the FAB horizontally
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: SizedBox(
        // Sets the width to 70% of the screen
        width: MediaQuery.of(context).size.width * 0.7,
        height: 60, // Standard height for a wide button
        child: FloatingActionButton(
          onPressed: () {
            print("Changes saved!");
          },
          // Using 'extended' style logic inside a standard FAB
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            "Save Changes",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            /// AppBar
            SliverAppBar(
              pinned: false,
              floating: false,
              snap: false,
              backgroundColor: colors.bgApp,
              elevation: 0,
              automaticallyImplyLeading: false,
              expandedHeight: kToolbarHeight + 10.h,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: colors.textMuted),
              ),
              title: Column(
                mainAxisAlignment: .start,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "Budget Settings",
                    style: GoogleFonts.inter(
                      color: colors.textMain,
                      fontSize: 22.sp,
                      fontWeight: .bold,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    "Adjust your allocations",
                    style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 15.sp,
                      fontWeight: .w500,
                    ),
                  ),
                ],
              ),
            ),

            /// Body Content
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Card(
                    elevation: 6,
                    shadowColor: Colors.black.withOpacity(0.45),
                    color: const Color(0xFF171616),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.r),
                      side: BorderSide(
                        color: Colors.white.withOpacity(0.10),
                        width:
                            0.8, // Using a fixed width or .w if using ScreenUtil
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Monthly Income",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: Colors
                                  .white, // Replaced colors.textMain with standard White
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Replacement for the 'spacing' property
                          SizedBox(
                            height: 50.h,
                            // Increased slightly for better tap target
                            child: TextField(
                              controller: incomeCtrl,
                              keyboardType: TextInputType.number,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              cursorColor: Colors.blue,
                              onChanged: (_) => setState(() {}),
                              decoration: InputDecoration(
                                hintText: '5000',
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                prefixIcon: const Icon(
                                  Icons.currency_bitcoin,
                                  color: Colors
                                      .greenAccent, // Replaced colors.marketUp
                                ),
                                suffixIcon: incomeCtrl.text.isNotEmpty
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.clear,
                                          size: 18,
                                          color: Colors.white54,
                                        ),
                                        onPressed: () {
                                          incomeCtrl.clear();
                                          setState(() {});
                                        },
                                      )
                                    : null,
                                filled: true,
                                fillColor: const Color(0xff1e1e1e),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    alignment: .center,
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 20,
                      top: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: colors.success.withOpacity(0.3),
                      border: Border.all(color: colors.success, width: 1),
                    ),
                    child: Column(
                      spacing: 5,
                      children: [
                        Text(
                          "100%",
                          style: GoogleFonts.inter(
                            fontSize: 40.sp,
                            fontWeight: .bold,
                            color: colors.marketUp,
                          ),
                        ),
                        Text(
                          "✨ Perfect Allocation",
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: .bold,
                            color: colors.textMain,
                          ),
                        ),
                        Text(
                          "Total budget must equal 100%",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: .bold,
                            color: colors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    crossAxisAlignment: .center,
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "Category Allocation",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: Colors
                              .white, // Replaced colors.textMain with standard White
                        ),
                      ),

                      Container(
                        alignment: .center,
                        height: 30.h,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: colors.primary.withOpacity(0.3),
                        ),
                        child: Row(
                          spacing: 8,
                          children: [
                            Icon(Icons.add, color: colors.primary, size: 20),
                            Text(
                              "Add Entry",
                              style: TextStyle(
                                color: colors.primary,
                                fontWeight: .bold,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) => Padding(
                    padding: const EdgeInsetsGeometry.only(bottom: 20),
                    child: Card(
                      elevation: 6,
                      shadowColor: Colors.black.withOpacity(0.45),
                      color: const Color(0xFF171616),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.r),
                        side: BorderSide(
                          color: colors.primary.withOpacity(0.6),
                          width: 0.8,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 18,
                          bottom: 18,
                          left: 15,
                          right: 15,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: .start,
                                  crossAxisAlignment: .start,
                                  spacing: 15,
                                  children: [
                                    Container(
                                      alignment: .center,
                                      height: 25.h,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                        color: colors.info,
                                        borderRadius: .circular(5.r),
                                      ),
                                      child: Text(
                                        "1",
                                        style: GoogleFonts.roboto(
                                          fontSize: 18.sp,
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
                                      "${_sliderValue.toStringAsFixed(2)} %",
                                      style: GoogleFonts.roboto(
                                        fontSize: 20.sp,
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

                            SliderTheme(
                              // double _sliderValue = max value 25
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 4.0,
                                activeTrackColor: Colors.blueAccent,
                                inactiveTrackColor: Colors.white10,
                                thumbColor: Colors.white,
                                overlayColor: Colors.blueAccent.withOpacity(
                                  0.2,
                                ),
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 10.0,
                                ),
                                overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 20.0,
                                ),
                              ),
                              child: Slider(
                                value: _sliderValue,
                                min: 10,
                                max: 36,
                                onChanged: (value) {
                                  setState(() {
                                    _sliderValue = value;
                                  });
                                },
                              ),
                            ),

                            Align(
                              alignment: .centerStart,
                              child: Text(
                                "\$ ${_sliderValue.toStringAsFixed(0)}",
                                style: GoogleFonts.roboto(
                                  fontSize: 20.sp,
                                  fontWeight: .bold,
                                  color: Color(0xff6c5dd3),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
