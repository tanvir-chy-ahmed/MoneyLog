import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneylog/data/local/model.dart';

import '../../themes/colors.dart';
import '../../themes/theme.dart';

class LivingRoom extends StatefulWidget {
  const LivingRoom({super.key});

  @override
  State<LivingRoom> createState() => _LivingRoomState();
}

class _LivingRoomState extends State<LivingRoom> {
  late List<DemoData> demoDataList = [
    DemoData(
      title: "Chain + Ring",
      category: "Hobby",
      price: 50,
      date: "01-12-2025",
      isUrgent: false,
      isHobby: false,
      isNecessary: true,
    ),
    DemoData(
      title: "iPhone Cover + Screen Protector",
      category: "Necessary",
      price: 80,
      date: "02-12-2025",
      isUrgent: true,
    ),
    DemoData(
      title: "DJI Air 3S",
      category: "Hobby",
      price: 60000,
      date: "03-12-2025",
      isNecessary: true,
    ),
    DemoData(
      title: "Belt Pant",
      category: "Necessary",
      price: 120,
      date: "04-12-2025",
      isUrgent: true,
    ),
    DemoData(
      title: "Savings",
      category: "Savings",
      price: 5000,
      date: "05-12-2025",
      isHobby: true,
    ),
    DemoData(
      title: "MacBook Air",
      category: "Hobby",
      price: 1500,
      date: "06-12-2025",

      isNecessary: true,
    ),
    DemoData(
      title: "New Android Phone 20+",
      category: "Hobby",
      price: 2000,
      date: "07-12-2025",
      isUrgent: true,
    ),
    DemoData(
      title: "Mouse Pad",
      category: "Necessary",
      price: 650,
      date: "08-12-2025",

      isNecessary: true,
    ),
    DemoData(
      title: "Cable Holder",
      category: "Necessary",
      price: 120,
      date: "09-12-2025",

      isNecessary: true,
    ),
    DemoData(
      title: "Monitor Bulb Light",
      category: "Necessary",
      price: 1200,
      date: "10-12-2025",
      isUrgent: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      backgroundColor: colors.bgApp,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Scrollable AppBar
            SliverAppBar(
              pinned: false, // scrolls away
              floating: false,
              snap: false,
              backgroundColor: colors.bgApp,
              elevation: 0,
              automaticallyImplyLeading: false,
              expandedHeight: kToolbarHeight + 10.h,
              centerTitle: false,
              title: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Living Room Upgrade",
                  style: GoogleFonts.inter(
                    color: colors.textMain,
                    fontSize: 20.sp, // FIXED SIZE
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),


            // Scrollable Content
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Debit Card
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.r),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF171616),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.10),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header Row
                            Row(
                              children: [
                                Text(
                                  "Total Planned",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: colors.textMuted,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "\$3,000 Budget",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            // Amount Row
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "\$4,400",
                                        style: GoogleFonts.roboto(
                                          fontSize: 33.sp,
                                          fontWeight: FontWeight.w700,
                                          color: colors.textMain,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ".00",
                                        style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: colors.textMuted,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    color: colors.textMuted,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            LinearProgressIndicator(
                              value: 0.4,
                              minHeight: 6.h,
                              borderRadius: BorderRadius.circular(12.r),
                              backgroundColor: Colors.grey.withOpacity(0.3),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                colors.marketUp,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            // Bottom Text
                            Row(
                              children: [
                                Text(
                                  "PURCHASED",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: colors.textMuted,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "REMAINING",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: colors.textMuted,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                Text(
                                  "\$2705",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    color: colors.marketUp,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "\$280",
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

                  SizedBox(height: 12.h),

                  // Sorted List Header
                  Row(
                    children: [
                      Text(
                        "Planned Items",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Sort by Priority",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                          color: colors.marketUp,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

                  // Planned Items List
                  ...demoDataList.map(
                    (data) => Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Dismissible(
                        key: ObjectKey(data),
                        background: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          color: colors.marketUp,
                          child: const Icon(
                            Icons.push_pin,
                            color: Colors.white,
                          ),
                        ),
                        child: _items(data, demoDataList.indexOf(data)),
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),
                ]),
              ),
            ),
          ],
        ),
      ),
    );

    //   Container(
    //   color: colors.bgApp,
    //   child: SafeArea(
    //     child: Column(
    //       children: [
    //         //  AppBar
    //         PreferredSize(
    //           preferredSize: Size.fromHeight(kToolbarHeight + 10.h),
    //           child: AppBar(
    //             backgroundColor: colors.bgApp,
    //             elevation: 0,
    //             automaticallyImplyLeading: false,
    //             // Prevents accidental back buttons
    //             titleSpacing: 5,
    //             title: Padding(
    //               padding: const EdgeInsets.only(left: 16),
    //               child: Text(
    //                 "Expense Items",
    //                 style: GoogleFonts.inter(
    //                   color: colors.textMain,
    //                   fontSize: 22.sp,
    //                   fontWeight: .bold,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //
    //         // Scrollable Content
    //         Expanded(
    //           child: SingleChildScrollView(
    //             // Removed the large top padding since it's no longer overlapping
    //             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
    //             physics: const BouncingScrollPhysics(),
    //             child: Column(
    //               mainAxisAlignment: .start,
    //               crossAxisAlignment: .start,
    //               children: [
    //                 /// Debit Card
    //                 SizedBox(
    //                   height: MediaQuery.of(context).size.height * 0.25,
    //                   width: double.infinity,
    //                   child: Card(
    //                     elevation: 4,
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(22.r),
    //                     ),
    //                     clipBehavior: Clip.antiAlias,
    //                     child: Container(
    //                       padding: EdgeInsets.only(
    //                         left: 16,
    //                         right: 16,
    //                         top: 16,
    //                         bottom: 0,
    //                       ),
    //                       decoration: BoxDecoration(
    //                         color: Color(0xFF171616),
    //                         border: Border.all(
    //                           color: Colors.white.withOpacity(0.10),
    //                           width: 1,
    //                         ),
    //                       ),
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           // Header Row
    //                           Row(
    //                             children: [
    //                               Text(
    //                                 "Total Planned",
    //                                 style: GoogleFonts.inter(
    //                                   fontWeight: FontWeight.w500,
    //                                   fontSize: 15.sp,
    //                                   color: colors.textMuted,
    //                                 ),
    //                               ),
    //                               const Spacer(),
    //                               Text(
    //                                 "\$3,000 Budget",
    //                                 style: GoogleFonts.roboto(
    //                                   fontWeight: FontWeight.bold,
    //                                   fontSize: 15.sp,
    //                                   color: Colors.white,
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //
    //                           SizedBox(height: 8.h),
    //
    //                           // Amount Row
    //                           Row(
    //                             mainAxisAlignment:
    //                                 MainAxisAlignment.spaceAround,
    //                             children: [
    //                               RichText(
    //                                 text: TextSpan(
    //                                   children: [
    //                                     TextSpan(
    //                                       text: "\$4,400",
    //                                       style: GoogleFonts.roboto(
    //                                         fontSize: 33.sp,
    //                                         fontWeight: FontWeight.w700,
    //                                         color: colors.textMain,
    //                                       ),
    //                                     ),
    //                                     TextSpan(
    //                                       text: ".00",
    //                                       style: GoogleFonts.roboto(
    //                                         fontSize: 14.sp,
    //                                         fontWeight: FontWeight.w600,
    //                                         color: colors.textMuted,
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //
    //                               SizedBox(width: 5.w),
    //                               IconButton(
    //                                 onPressed: () {},
    //                                 icon: Icon(
    //                                   Icons.edit,
    //                                   color: colors.textMuted,
    //                                 ),
    //                               ),
    //                               const Spacer(),
    //                             ],
    //                           ),
    //
    //                           SizedBox(height: 8.h),
    //
    //                           LinearProgressIndicator(
    //                             value: 0.4,
    //                             minHeight: 6.h,
    //                             borderRadius: BorderRadius.circular(12.r),
    //                             backgroundColor: Colors.grey.withOpacity(0.3),
    //                             valueColor: AlwaysStoppedAnimation<Color>(
    //                               colors.marketUp,
    //                             ),
    //                           ),
    //
    //                           SizedBox(
    //                             height:
    //                                 MediaQuery.of(context).size.height * 0.02,
    //                           ),
    //
    //                           // Pushes bottom text down if needed
    //
    //                           // Bottom Text
    //                           Row(
    //                             children: [
    //                               Text(
    //                                 "PURCHASED",
    //                                 style: GoogleFonts.inter(
    //                                   fontWeight: FontWeight.w500,
    //                                   fontSize: 13.sp,
    //                                   color: colors.textMuted,
    //                                 ),
    //                               ),
    //                               const Spacer(),
    //                               Text(
    //                                 "REMAINING",
    //                                 style: GoogleFonts.inter(
    //                                   fontWeight: FontWeight.w500,
    //                                   fontSize: 13.sp,
    //                                   color: colors.textMuted,
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                           SizedBox(
    //                             height:
    //                                 MediaQuery.of(context).size.height * 0.007,
    //                           ),
    //                           Row(
    //                             children: [
    //                               Text(
    //                                 "\$2705",
    //                                 style: GoogleFonts.roboto(
    //                                   fontWeight: FontWeight.bold,
    //                                   fontSize: 15.sp,
    //                                   color: colors.marketUp,
    //                                 ),
    //                               ),
    //                               const Spacer(),
    //                               Text(
    //                                 "\$280",
    //                                 style: GoogleFonts.roboto(
    //                                   fontWeight: FontWeight.bold,
    //                                   fontSize: 15.sp,
    //                                   color: Colors.white,
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //
    //                 SizedBox(height: 12.h),
    //
    //                 /// Sorted list
    //                 Row(
    //                   children: [
    //                     Text(
    //                       "Planned Items",
    //                       style: GoogleFonts.roboto(
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 15.sp,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                     const Spacer(),
    //                     Text(
    //                       "Sort by Priority",
    //                       style: GoogleFonts.roboto(
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 13.sp,
    //                         color: colors.marketUp,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //
    //                 SizedBox(height: 12.h),
    //
    //                 /// Planned Items
    //                 ListView.builder(
    //                   itemCount: demoDataList.length,
    //                   shrinkWrap: true,
    //                   physics: NeverScrollableScrollPhysics(),
    //                   itemBuilder: (_, index) {
    //                     final data = demoDataList[index];
    //                     return Dismissible(
    //                       key: ObjectKey(data),
    //                       background: Container(
    //                         alignment: Alignment.centerLeft,
    //                         padding: EdgeInsets.symmetric(horizontal: 20.w),
    //                         color: colors.marketUp,
    //                         child: Icon(Icons.push_pin, color: Colors.white),
    //                       ),
    //                       child: Padding(
    //                         padding: EdgeInsets.only(bottom: 8.h),
    //                         child: _items(data, index), // pass index
    //                       ),
    //                     );
    //                   },
    //                 ),
    //
    //                 // Bottom Spacing
    //                 SizedBox(height: 30.h),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget _items(DemoData data, int index) {
    final colors = Theme.of(context).extension<AppColors>()!;
    // Determine box and text color based on flags
    Color boxColor;
    Color textColor;

    if (data.isNecessary) {
      boxColor = Colors.blue; // Box blue
      textColor = Colors.white; // Text white
    } else if (data.isUrgent) {
      boxColor = Colors.red.shade900; // Box red
      textColor = Colors.white; // Text white
    } else if (data.isHobby) {
      boxColor = Color(0xFF8A2BE2); // Purple shade for box
      textColor = Colors.purple.shade50; // Text lighter purple
    } else {
      boxColor = Colors.grey; // Default fallback
      textColor = Colors.white;
    }

    Color applyDark(Color original) {
      // Reduce brightness by 40% for dark effect
      return Color.fromARGB(
        original.alpha,
        (original.red * 0.6).toInt(),
        (original.green * 0.6).toInt(),
        (original.blue * 0.6).toInt(),
      );
    }

    return Card(
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.45),
      color: data.isSwitched
          ? applyDark(const Color(0xFF171616))
          : const Color(0xFF171616),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.r),
        side: BorderSide(color: Colors.white.withOpacity(0.10), width: 0.8.w),
      ),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: () {},
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),

        /// ─── TOP SECTION ───
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 22.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: data.isSwitched ? applyDark(boxColor) : boxColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    data.category,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: data.isSwitched ? applyDark(textColor) : textColor,
                      decoration: data.isSwitched
                          ? TextDecoration.lineThrough
                          : null,
                      decorationThickness: data.isSwitched ? 2 : null,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  "Due ${data.date}",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: data.isSwitched
                        ? applyDark(Colors.white.withOpacity(0.7))
                        : Colors.white.withOpacity(0.7),
                    decoration: data.isSwitched
                        ? TextDecoration.lineThrough
                        : null,
                    decorationThickness: data.isSwitched ? 2 : null,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            /// ─── BOTTOM CONTENT ───
            Text(
              data.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: data.isSwitched
                    ? applyDark(colors.textMain)
                    : colors.textMain,
                decoration: data.isSwitched ? TextDecoration.lineThrough : null,
                decorationThickness: data.isSwitched ? 2 : null,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "\$ ${data.price}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                color: data.isSwitched
                    ? applyDark(colors.marketUp)
                    : colors.marketUp,
                decoration: data.isSwitched ? TextDecoration.lineThrough : null,
                decorationThickness: data.isSwitched ? 2 : null,
              ),
            ),
          ],
        ),

        /// ─── TRAILING SWITCH ───
        trailing: Transform.scale(
          scale: 0.9,
          child: Switch.adaptive(
            activeTrackColor: colors.marketUp,
            inactiveTrackColor: const Color(0xFF2a2a2a),
            value: data.isSwitched,
            onChanged: (value) {
              setState(() {
                demoDataList[index].isSwitched = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
