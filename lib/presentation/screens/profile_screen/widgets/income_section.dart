import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../data/local/model.dart';
import '../../../provider/net_income_provider.dart';
import '../../../themes/theme.dart';

class IncomeSection extends StatefulWidget {
  const IncomeSection({super.key});

  @override
  State<IncomeSection> createState() => _IncomeSectionState();
}

class _IncomeSectionState extends State<IncomeSection> {
  final TextEditingController netIncomeCtrl = TextEditingController();
  final FocusNode netIncomeFocusNode = FocusNode();

  bool recurringIncomeSwitch = false;

  double value = 0.16; // 16%

  late List<DemoData> demoDataList = [
    DemoData(
      title: "Food & Dining",
      subtitle: "Expenses",
      category: "Hobby",
      price: 50,
      date: "01-12-2025",
      isUrgent: false,
      isHobby: false,
      isNecessary: true,
    ),
    DemoData(
      title: "Transport",
      subtitle: "Expenses",
      category: "Necessary",
      price: 80,
      date: "02-12-2025",
      isUrgent: true,
    ),
    DemoData(
      title: "Housing",
      subtitle: "Expenses",
      category: "Hobby",
      price: 60000,
      date: "03-12-2025",
      isNecessary: true,
    ),
    DemoData(
      title: "Entertainment",
      subtitle: "Expenses",
      category: "Necessary",
      price: 120,
      date: "04-12-2025",
      isUrgent: true,
    ),
    DemoData(
      title: "Shopping",
      category: "Savings",
      subtitle: "Expenses",
      price: 5000,
      date: "05-12-2025",
      isHobby: true,
    ),
    DemoData(
      title: "Health",
      category: "Hobby",
      subtitle: "Expenses",
      price: 1500,
      date: "06-12-2025",

      isNecessary: true,
    ),
  ];

  @override
  void dispose() {
    netIncomeCtrl.dispose();
    netIncomeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final income = int.tryParse(netIncomeCtrl.text) ?? 0;
    print("main widget build");

    return Scaffold(
      backgroundColor: colors.bgApp,
      appBar: AppBar(
        backgroundColor: colors.bgApp,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Income",
          style: GoogleFonts.inter(
            color: colors.textMain,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),

          child: Column(
            children: [
              Card(
                elevation: 6,
                shadowColor: Colors.black.withOpacity(0.45),
                color: const Color(0xFF171616),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.r),
                  side: BorderSide(
                    color: Colors.white.withOpacity(0.10),
                    width: 0.8.w,
                  ),
                ),

                /// ONE horizontal padding for entire card
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Header Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Configuration",
                            style: GoogleFonts.inter(
                              color: Colors.grey,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          Consumer<NetIncomeProvider>(
                            builder: (context, value, child) {
                              return ElevatedButton(
                                onPressed: () {
                                  /// Save ALL Button Logic Goes Here
                                  value.getBudget(income);
                                  if(income == null) return;
                                  Navigator.pop(context);
                                  print("txt widget build");
                                  ///
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF33c67c),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24.w,
                                    vertical: 7.h,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17.r),
                                  ),
                                ),
                                child: Text(
                                  "SAVE ALL",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 14.h),

                      /// Title
                      Text(
                        "Monthly Net Income",
                        style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      /// TextField
                      TextField(
                        controller: netIncomeCtrl,
                        focusNode: netIncomeFocusNode,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        cursorColor: Colors.blue,
                        onChanged: (_) => setState(() {}),

                        decoration: InputDecoration(
                          hintText: '5000',
                          hintStyle: TextStyle(
                            color: Colors.white54,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          prefixIcon: Icon(
                            Icons.currency_bitcoin,
                            color: colors.marketUp,
                          ),
                          suffixIcon: netIncomeCtrl.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    netIncomeCtrl.clear();
                                    setState(() {});
                                  },
                                )
                              : null,
                          filled: true,
                          fillColor: const Color(0xff1e1e1e),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 10.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      SizedBox(height: 18.h),

                      /// Recurring Income Card
                      Card(
                        color: const Color(0xFF1a1a1a),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.r),
                          side: BorderSide(
                            color: Colors.white.withOpacity(0.10),
                            width: 0.8.w,
                          ),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                          ),
                          title: Text(
                            "Recurring Income",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Repeat this budget every month",
                            style: GoogleFonts.inter(
                              color: Colors.grey,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Switch.adaptive(
                            activeTrackColor: colors.marketUp,
                            inactiveTrackColor: const Color(0xFF2a2a2a),
                            value: recurringIncomeSwitch,
                            onChanged: (value) {
                              setState(() {
                                recurringIncomeSwitch = value;
                              });
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 18.h),

                      /// Budget Allocated
                      Row(
                        children: [
                          Text(
                            "Budget Allocated",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: '67% ',
                                  style: TextStyle(color: colors.marketUp),
                                ),
                                TextSpan(
                                  text: 'Allocated',
                                  style: TextStyle(color: colors.textMuted),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 8.h),

                      LinearProgressIndicator(
                        value: 0.4,
                        minHeight: 8.h,
                        borderRadius: BorderRadius.circular(12.r),
                        backgroundColor: Colors.grey.withOpacity(0.3),
                        valueColor: AlwaysStoppedAnimation(colors.marketUp),
                      ),

                      SizedBox(height: 12.h),

                      Row(
                        children: [
                          Text(
                            "\$3350.00 Allocated",
                            style: GoogleFonts.inter(
                              fontSize: 13.sp,
                              color: colors.textMuted,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "\$1650.00 Unassigned",
                            style: GoogleFonts.inter(
                              fontSize: 13.sp,
                              color: colors.textMuted,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12.h),

                      Text(
                        "Category Allocations",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12.h),

                      /// Planned Items
                      ListView.builder(
                        itemCount: demoDataList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final data = demoDataList[index];
                          return Dismissible(
                            key: ObjectKey(data),
                            background: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              color: colors.marketUp,
                              child: Icon(Icons.push_pin, color: Colors.white),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: _items(data, index, colors), // pass index
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _items(DemoData data, int index, AppColors colors) {
    return Card(
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.45),
      color: const Color(0xFF252525),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.r),
        side: BorderSide(color: Colors.white.withOpacity(0.10), width: 0.8.w),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
            leading: Container(
              height: 35.h,
              width: 40.w,

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.greenAccent, Colors.teal],
                ),
                borderRadius: BorderRadius.circular(22.r),
              ),
              child: Center(
                child: Text(
                  "F",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            title: Text(
              data.title,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              data.subtitle,
              style: GoogleFonts.inter(
                color: Colors.grey,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Row(
            children: [
              // Slider Area
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 8.h,
                    activeTrackColor: colors.marketUp,
                    inactiveTrackColor: Colors.grey.withOpacity(0.3),
                    thumbColor: colors.marketUp,
                    overlayColor: colors.marketUp.withOpacity(0.15),
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 7,
                    ),
                    trackShape: const RoundedRectSliderTrackShape(),
                  ),
                  child: Slider(
                    value: value,
                    min: 0,
                    max: 1,
                    divisions: 100,
                    onChanged: (newValue) {
                      setState(() {
                        value = newValue;
                      });
                    },
                  ),
                ),
              ),

              // Percentage Box (Right Side)
              Container(
                height: 26.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF1a1a1a),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  '${(value * 100).round()}%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(width: 10.w),
            ],
          ),

          SizedBox(height: 5.h),

          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              children: [
                Text(
                  "\$ ${data.price}",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Spent ",
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          color: colors.textMuted,
                        ),
                      ),
                      TextSpan(
                        text: "\$321",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
