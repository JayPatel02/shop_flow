import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_images.dart';
import 'package:shop_flow/core/constants/app_routes.dart';
import 'package:shop_flow/core/constants/app_string.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/utilities/single_image_picker.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? profileImage = '';
  String sampleEmail = 'test@gmail.com';
  String sampleName = 'Test User';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 48,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 45,
                            backgroundImage: profileImage != ''
                                ? FileImage(File(profileImage!))
                                : null,
                            child: profileImage == ""
                                ? SvgPicture.asset(
                                    AppImages.defaultAvatar,
                                    height: 60,
                                  )
                                : null,
                          ),
                        ),
                        Positioned(
                          top: 50,
                          right: -12,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              String? selectedImage = await pickImageFromGallery();
                              if (selectedImage != null) {
                                setState(() {
                                  profileImage = selectedImage;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              iconAlignment: IconAlignment.end,
                              backgroundColor: AppColor.primaryColor,
                              shape: CircleBorder(),
                            ),
                            label: Text(""),
                            icon: SvgPicture.asset(
                              AppImages.editPencil,
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcATop,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    sampleName,
                    style: AppTextStyle.style(
                      fontSize: 24,
                      fontWeight: .bold,
                      height: 1.35,
                      color: AppColor.textPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    sampleEmail,
                    style: AppTextStyle.style(
                      color: AppColor.textLabelColor,
                      height: 1.35,
                    ),
                  ),
                  SizedBox(height: 40),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          if(index == 1){
                            Navigator.of(context).pushNamed(AppRoutes.viewSellerDashboard);
                          }
                        },
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsetsGeometry.all(16),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.palePastelLavender,
                                    shape: .circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: AppString.profileTiles[index]['icon'],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    AppString.profileTiles[index]['header'],
                                    style: AppTextStyle.style(
                                      fontWeight: .medium,
                                      fontSize: 18,
                                      height: 1.35,
                                      color: AppColor.textPrimaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Icon(
                                  Icons.navigate_next,
                                  color: AppColor.textLabelColor,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 8);
                    },
                    itemCount: AppString.profileTiles.length,
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: AppColor.backgroundGray),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32 , horizontal: 20),
                child: TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: AppColor.backgroundRedColor,
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                          borderRadius: .circular(12)
                      )
                  ),
                  icon: Icon(Icons.logout , color: AppColor.textRedColor,),
                  label: Text(
                    AppString.logout,
                    style: AppTextStyle.style(
                      fontSize: 18,
                      fontWeight: .semiBold,
                      height: 1.335,
                      color: AppColor.textRedColor,
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
