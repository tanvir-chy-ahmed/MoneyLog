import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../themes/colors.dart';
import '../../../themes/theme.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  // Input
  TextEditingController nameCtrl = TextEditingController();
  FocusNode nameFocusNode = FocusNode();

  @override
  void dispose() {
    nameCtrl.dispose();
    nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    String firstLetter = nameCtrl.text.trim().isNotEmpty
        ? nameCtrl.text.trim()[0]
        : "";

    return Scaffold(
      backgroundColor: colors.bgApp,
      appBar: AppBar(
        backgroundColor: colors.bgApp,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back, color: Colors.white),
          onTap: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Profile",
          style: GoogleFonts.inter(
            color: colors.textMain,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          physics: const BouncingScrollPhysics(),
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                    top: 8,
                    right: 5,
                    left: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisSize: .min,
                    spacing: 8,
                    children: [
                      SizedBox(height: 5),

                      ListTile(
                        title: Text(
                          nameCtrl.text.trim().isEmpty
                              ? "User"
                              : nameCtrl.text.trim(),
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          "Personal Details",
                          style: GoogleFonts.inter(
                            color: Colors.grey,
                            fontSize: 13.sp,
                            fontWeight: .w500,
                          ),
                        ),
                        leading: Container(
                          height: 100.h,
                          width: 50.w,

                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.greenAccent, Colors.teal],
                            ),
                            borderRadius: BorderRadius.circular(22.r),
                          ),
                          child: nameCtrl.text.trim().isEmpty
                              ? Icon(Icons.person, color: Colors.black)
                              : Center(
                                  child: Text(
                                    firstLetter.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      fontWeight: .bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: .center,
                                  ),
                                ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Name",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 18, right: 10),
                        child: TextField(
                          controller: nameCtrl,
                          focusNode: nameFocusNode,
                          decoration: InputDecoration(
                            hintText: 'User',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.deepPurple,
                            ),
                            suffixIcon: nameCtrl.text.isNotEmpty
                                ? IconButton(
                                    icon: Icon(Icons.clear),
                                    onPressed: () {
                                      nameCtrl.clear();
                                      setState(() {}); // Optional: update UI
                                    },
                                  )
                                : null,
                            filled: true,
                            fillColor: Color(0xff1e1e1e),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.r),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.r),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.r),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                          textInputAction: TextInputAction.search,
                          //onEditingComplete: () => FocusScope.of(context).requestFocus(passFocusMode),
                          keyboardType: TextInputType.text,
                          autocorrect: true,
                          enableSuggestions: true,
                          cursorColor: Colors.blue,
                          onChanged: (value) {
                            setState(() {}); // Update suffix icon
                            // Add debounce logic if needed
                          },
                        ),
                      ),

                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.only(left: 18, right: 10),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // 👇 This is your button logic
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.save, color: Colors.white),
                          label: Text(
                            "Save Changes",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff6c5dd3),
                            // Button color
                            foregroundColor: Colors.white,
                            // Text/Icon color
                            elevation: 0,
                            // Shadow depth
                            padding: EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                18.r,
                              ), // Rounded corners
                            ),
                            shadowColor: Colors.deepPurpleAccent,
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
