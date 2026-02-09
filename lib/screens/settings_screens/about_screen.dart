import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_demo/components/custom_appbar.dart';
import 'package:web_app_demo/controller/about_controller.dart';
import 'package:web_app_demo/utils/string_utils.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AboutController aboutController = Get.put(AboutController());
    return Scaffold(
      appBar: const CustomAppBar(label: "About"),
      body: aboutController.data!.data!.is_show_social == false
          ? Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0.r, left: 30.0.r),
                  child: Text(
                    aboutController.data!.data!.description!,
                    style: GoogleFonts.urbanist(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 110.h,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Version 1.0.0',
                        style: GoogleFonts.urbanist(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.r),
                    child: Text(
                      aboutController.data!.data!.copyright!,
                      style: GoogleFonts.urbanist(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0.r, left: 30.r),
                  child: Text(
                    aboutController.data!.data!.description!,
                    style: GoogleFonts.urbanist(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2),
                    ),
                    itemCount: StringUtils.aboutDetails.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          switch (index) {
                            case 0:
                              aboutController.openWhatsapp(context);
                              break;
                            case 1:
                              aboutController.openInstagram();
                              break;
                            case 2:
                              aboutController.openTwitter();
                              break;
                            case 3:
                              aboutController.openFacebook();
                              break;
                            case 4:
                              aboutController.openContact();
                              break;
                            case 5:
                              aboutController.openSnapchat();
                              break;
                            case 6:
                              aboutController.openSkype();
                              break;
                            case 7:
                              aboutController.openMessenger();
                              break;
                            case 8:
                              aboutController.openYoutube();
                              break;
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 40.r,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  StringUtils.aboutDetails[index]['image'],
                                  height: 35.h,
                                  width: 35.w,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  StringUtils.aboutDetails[index]['label'],
                                  style: GoogleFonts.urbanist(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: Text(
                    aboutController.data!.data!.copyright!,
                    style: GoogleFonts.urbanist(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
    );
  }
}
