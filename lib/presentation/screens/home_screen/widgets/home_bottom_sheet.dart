import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneylog/presentation/themes/colors.dart';
import 'package:moneylog/presentation/widgets/spacer.dart';

import '../../../themes/theme.dart';
import '../../../widgets/datebox.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final FocusNode titleNode = FocusNode();
  final FocusNode priceNode = FocusNode();
  final FocusNode noteNode = FocusNode();

  /// Calender Node & Ctrl
  final TextEditingController dayCtrl = TextEditingController();
  final TextEditingController monthCtrl = TextEditingController();
  final TextEditingController yearCtrl = TextEditingController();

  final FocusNode dayNode = FocusNode();
  final FocusNode monthNode = FocusNode();
  final FocusNode yearNode = FocusNode();

  @override
  void initState() {
    dayCtrl.text = "dd";
    monthCtrl.text = "mm";
    yearCtrl.text = "yyyy";
    super.initState();
  }

  @override
  void dispose() {
    dayCtrl.dispose();
    monthCtrl.dispose();
    yearCtrl.dispose();

    dayNode.dispose();
    monthNode.dispose();
    yearNode.dispose();

    priceController.dispose();
    titleController.dispose();
    noteController.dispose();

    titleNode.dispose();
    priceNode.dispose();
    noteNode.dispose();

    super.dispose();
  }

  // 1. Define your data list
  final List<String> categories = [
    "Food",
    "Drinks",
    "Snacks",
    "Dessert",
    "Vegan",
  ];

  // 2. Track the selected index (instead of a boolean)
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1a1a1a),
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      height: MediaQuery.of(context).size.height * 0.8,
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
                        "Add Expense",
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

                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                  // Amount Input Section
                  Column(
                    children: [
                      Text(
                        "Amount",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),

                      /// Price Amount Section
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        // Aligns currency symbol with number base
                        children: [
                          SizedBox(width: 30.w),
                          Padding(
                            padding: EdgeInsets.only(right: 8.w, top: 4.h),
                            child: Text(
                              "৳",
                              style: GoogleFonts.inter(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 180.w,
                            child: TextField(
                              controller: priceController,
                              focusNode: priceNode,
                              autofocus: true,
                              onEditingComplete: () => FocusScope.of(
                                context,
                              ).requestFocus(titleNode),
                              // Automatically opens keyboard
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(7),
                              ],
                              style: GoogleFonts.inter(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: '0',
                                hintStyle: TextStyle(color: Colors.white24),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  AppSpacing.h8,

                  /// Title
                  Row(
                    children: [
                      Text(
                        "TITLE",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),

                      Spacer(),
                    ],
                  ),

                  AppSpacing.h8,

                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      //for pass field
                      controller: titleController,
                      focusNode: titleNode,

                      decoration: InputDecoration(
                        hintText: 'What is This for?',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.title, color: Colors.grey),
                        suffixIcon: titleController.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  titleController.clear();
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
                        fontWeight: FontWeight.w500,
                      ),
                      textInputAction: TextInputAction.done,
                      //use next to go next field
                      // use when you want to go next textfield
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(dayNode),
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
                  AppSpacing.h8,

                  /// Category
                  Text(
                    "CATEGORY",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),

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
                          child: Container(
                            width: 80.w,
                            margin: EdgeInsets.only(right: 10.w),
                            // Space between items
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Container(
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
                        );
                      },
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

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
                          // hint: "DD",
                          maxlength: 2,
                          controller: dayCtrl,
                          focusNode: dayNode,
                          nextNode: monthNode,
                        ),

                        _separator(),

                        /// MM
                        Datebox(
                          // hint: "MM",
                          maxlength: 2,
                          controller: monthCtrl,
                          focusNode: monthNode,
                          nextNode: yearNode,
                        ),

                        _separator(),

                        /// YYYY
                        Datebox(
                          // hint: "YYYY",
                          maxlength: 4,
                          controller: yearCtrl,
                          focusNode: yearNode,
                          nextNode: noteNode,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  /// Add Note
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      //for pass field
                      controller: noteController,
                      focusNode: noteNode,

                      decoration: InputDecoration(
                        hintText: 'Add a note...',
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: noteController.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  noteController.clear();
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
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      textInputAction: TextInputAction.done,
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
                  AppSpacing.h8,
                ],
              ),
            ),
          ),
          SafeArea(
            child: SizedBox(
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
