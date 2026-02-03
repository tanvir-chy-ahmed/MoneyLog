import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneylog/presentation/widgets/datebox.dart';
import 'package:moneylog/presentation/widgets/spacer.dart';

import '../../../themes/colors.dart';
import '../../../themes/theme.dart';

class LivingroomBottomSheet extends StatefulWidget {
  const LivingroomBottomSheet({super.key});

  @override
  State<LivingroomBottomSheet> createState() => _LivingroomBottomSheetState();
}

class _LivingroomBottomSheetState extends State<LivingroomBottomSheet> {
  /// Item
  final TextEditingController ItemNameCtrl = TextEditingController();
  final TextEditingController ItemPriceCtrl = TextEditingController();

  final FocusNode ItemNameNode = FocusNode();
  final FocusNode ItemPriceNode = FocusNode();

  /// Calender
  final TextEditingController dayCtrl = TextEditingController();
  final TextEditingController monthCtrl = TextEditingController();
  final TextEditingController yearCtrl = TextEditingController();

  final FocusNode dayNode = FocusNode();
  final FocusNode monthNode = FocusNode();
  final FocusNode yearNode = FocusNode();

  // 1. Define your data list
  final List<String> categories = ["Urgent", "Necessary", "Hobby", "+"];

  int _selectedIndex = 0;

  @override
  void initState() {
    dayCtrl.text = "dd";
    monthCtrl.text = "mm";
    yearCtrl.text = "yyyy";
    super.initState();
  }

  @override
  void dispose() {
    /// Item Controllers & Node
    ItemNameCtrl.dispose();
    ItemPriceCtrl.dispose();

    ItemNameNode.dispose();
    ItemPriceNode.dispose();

    /// Calender Controllers & Node
    dayCtrl.dispose();
    monthCtrl.dispose();
    yearCtrl.dispose();

    dayNode.dispose();
    monthNode.dispose();
    yearNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1a1a1a),
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      height: MediaQuery.of(context).size.height * 0.55,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Item",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: Colors
                              .white, // Replaced colors.textMain for the example
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.close,
                          color: Colors.grey,
                          size: 25,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                  /// Item Name
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      //for pass field
                      controller: ItemNameCtrl,
                      focusNode: ItemNameNode,

                      decoration: InputDecoration(
                        hintText: 'Item Name (e.g. New Drone)',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.title, color: Colors.grey),
                        suffixIcon: ItemNameCtrl.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  ItemNameCtrl.clear();
                                  setState(() {}); // Optional: update UI
                                },
                              )
                            : null,
                        filled: true,
                        fillColor: Color(0x0DFFFFFF),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.10),
                            width: 0.8.w,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.10),
                            width: 0.8.w,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: colors.marketUp),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: .w500,
                      ),
                      textInputAction: TextInputAction.next,
                      //use next to go next field
                      // use when you want to go next textfield
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(ItemPriceNode),
                      keyboardType: TextInputType.text,
                      autocorrect: true,
                      enableSuggestions: true,
                      cursorColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {}); // Update suffix icon
                        // Add debounce logic if needed
                      },
                      onSubmitted: (value) {
                        // Perform search
                        print("Search: $value");
                      },
                    ),
                  ),

                  AppSpacing.h16,

                  /// Item Price
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      //for pass field
                      controller: ItemPriceCtrl,

                      focusNode: ItemPriceNode,
                      decoration: InputDecoration(
                        hintText: 'Price (e.g. 500)',
                        prefixIcon: Icon(
                          Icons.currency_bitcoin,
                          color: Colors.grey,
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: ItemPriceCtrl.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  ItemPriceCtrl.clear();
                                  setState(() {}); // Optional: update UI
                                },
                              )
                            : null,
                        filled: true,
                        fillColor: Color(0x0DFFFFFF),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.10),
                            width: 0.8.w,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.10),
                            width: 0.8.w,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: colors.marketUp),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: .w500,
                      ),
                      textInputAction: TextInputAction.done,
                      // onEditingComplete: () => FocusScope.of(context).requestFocus(passFocusMode),
                      keyboardType: TextInputType.number,
                      autocorrect: true,
                      enableSuggestions: true,
                      cursorColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {}); // Update suffix icon
                        // Add debounce logic if needed
                      },
                      onSubmitted: (value) {
                        // Perform search
                        print("Search: $value");
                      },
                    ),
                  ),

                  AppSpacing.h16,

                  /// Calender
                  Container(
                    height: 40.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: const Color(0x0DFFFFFF),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.10),
                        width: 0.8.w,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 18,
                          color: Color(0xFF6C5DD3),
                        ),
                        SizedBox(width: 10.w),

                        /// DD
                        Datebox(
                          maxlength: 2,
                          controller: dayCtrl,
                          focusNode: dayNode,
                          nextNode: monthNode,
                        ),

                        _separator(),

                        /// MM
                        Datebox(
                          maxlength: 2,
                          controller: monthCtrl,
                          focusNode: monthNode,
                          nextNode: yearNode,
                        ),

                        _separator(),

                        /// YYYY
                        Datebox(
                          maxlength: 4,
                          controller: yearCtrl,
                          focusNode: yearNode,
                        ),
                      ],
                    ),
                  ),

                  AppSpacing.h16,

                  // Category Implementation
                  SizedBox(
                    height: 40.h, // Constrain the height of the horizontal list
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      // Optional padding
                      itemBuilder: (context, index) {
                        bool isSelected = _selectedIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: IntrinsicWidth(
                              // Space between items
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Container(
                                  height: 40.h,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.10),
                                      width: 0.8.w,
                                    ),
                                    color: isSelected
                                        ? const Color(0xFF6C5DD3)
                                        : const Color(0xFF171616),
                                  ),
                                  child: Text(
                                    categories[index],
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  AppSpacing.h16,
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              height: 45.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  /// Save Expense Logics
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6c5dd3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  "Save Expense",
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _dateBox({
  //   required int maxlength,
  //   required TextEditingController controller,
  //   required FocusNode focusNode,
  //   FocusNode? nextNode,
  // }) {
  //   return SizedBox(
  //     width: maxlength == 4 ? 55.w : 30.w,
  //     child: TextField(
  //       controller: controller,
  //       focusNode: focusNode,
  //       keyboardType: TextInputType.number,
  //       textAlign: TextAlign.center,
  //       inputFormatters: [
  //         LengthLimitingTextInputFormatter(maxlength),
  //         FilteringTextInputFormatter.digitsOnly,
  //       ],
  //       style: GoogleFonts.roboto(
  //         color: Colors.white,
  //         fontWeight: FontWeight.w500,
  //         fontSize: 14.sp,
  //       ),
  //       decoration: const InputDecoration(
  //         border: InputBorder.none,
  //         counterText: '',
  //         contentPadding: EdgeInsets.zero,
  //       ),
  //
  //       cursorColor: colors.marketUp,
  //
  //       /// 🔵 AUTO SELECT FULL VALUE ON TAP
  //       onTap: () {
  //         controller.selection = TextSelection(
  //           baseOffset: 0,
  //           extentOffset: controller.text.length,
  //         );
  //       },
  //
  //       /// ➡️ AUTO MOVE TO NEXT FIELD
  //       onChanged: (value) {
  //         if (value.length == maxlength && nextNode != null) {
  //           FocusScope.of(context).requestFocus(nextNode);
  //         }
  //       },
  //     ),
  //   );
  // }

  Widget _separator() {
    return Text(
      '/',
      style: GoogleFonts.roboto(
        color: Colors.white.withOpacity(0.6),
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
      ),
    );
  }
}
