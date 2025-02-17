import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reminder_apps/features/reminder_screen/reminder_with_picture.dart';
import 'package:reminder_apps/features/settings_screen/help_support_screen.dart';
import 'package:reminder_apps/features/settings_screen/snooze_settings.dart';
import 'package:reminder_apps/gen/colors.gen.dart';
import 'package:reminder_apps/helper/ui_helpers.dart';
import '../../constant/text_font_style.dart';
import '../../gen/assets.gen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            // Optional padding to align it better
            child: SvgPicture.asset(
              Assets.icons.backButton,
            ),
          ),
        ),
        title: Text(
          'Help & Support',
          style: TextFontStyle.text16cFF6E5782w600.copyWith(
            fontSize: 20.sp,
            color: AppColors.c000000,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Image.asset(
              Assets.images.profilePic.path,
              height: 100.h,
              width: 100.w,
            ),
            UIHelper.verticalSpaceMedium,
            Text(
              'Kevin George',
              style: TextFontStyle.text16cFF6E5782w600.copyWith(
                fontSize: 22.sp,
                color: AppColors.c000000,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.cFFFFFF),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icons.nounReminder,
                          height: 45.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Reminder',
                              style: TextFontStyle.text10poppinscFF6E5782w600,
                            ),
                            Row(
                              children: [
                                Text(
                                  '24510',
                                  style: TextFontStyle
                                      .text10poppinscFF6E5782w600
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                SvgPicture.asset(
                                  Assets.icons.backArrow,
                                  width: 25.w,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.cFFFFFF),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icons.activeReminderSvg,
                          height: 45.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Active Reminder',
                              style: TextFontStyle.text10poppinscFF6E5782w600,
                            ),
                            Row(
                              children: [
                                Text(
                                  '14510',
                                  style: TextFontStyle
                                      .text10poppinscFF6E5782w600
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                SvgPicture.asset(
                                  Assets.icons.backArrow,
                                  width: 25.w,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            UIHelper.verticalSpaceMedium,

            /*setting listing*/
            SettingMenuWidget(
              svg: Image.asset(Assets.images.smallClock.path, height: 25.h,),
              title: 'Snooze Settings',
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SnoozeSettings()));
              },
            ),
            SettingMenuWidget(
              svg: Image.asset(Assets.images.cogwheel.path, height: 25.h,),
              title: 'Personal Settings',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ReminderWithPicture()));
              },
            ),
            SettingMenuWidget(
              svg: Image.asset(Assets.images.mobile.path, height: 25.h,),
              title: 'Tutorial Settings',
              onPress: () {},
            ),
            SettingMenuWidget(
              svg: Image.asset(Assets.images.customerService.path, height: 25.h,),
              title: 'Help & Support',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const HelpSupportScreen()));
              },
            ),

          ],
        ),
      ),
    );
  }
}

class SettingMenuWidget extends StatelessWidget {
  const SettingMenuWidget({
    super.key,
    required this.title,
    required this.svg,
    required this.onPress,
  });

  final String title;
  final Image svg;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            svg,
            UIHelper.horizontalSpaceMedium,
            Expanded(
                child: Text(
              title,
              style: TextFontStyle.text16cFF6E5782w600
                  .copyWith(color: AppColors.c000000),
            )),
            SvgPicture.asset(
              Assets.icons.chevronDown,
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
