import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_string.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/core/widgets/common_image_view.dart';
import 'package:shop_flow/core/widgets/common_input_field.dart';
import 'package:shop_flow/core/widgets/common_text_area.dart';
import 'package:shop_flow/core/widgets/padded_label.dart';
import 'package:shop_flow/features/product_module/add_product/model/add_product_model.dart';
import 'package:shop_flow/utilities/calculate_discounted_price.dart';
import 'package:shop_flow/utilities/single_image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final AddProductModel productDetails = AddProductModel();
  List<Widget> imageSelectionButtons = [];

  void _calculatePrice(String value) {
    setState(() {
      productDetails.sellingPrice = getDiscountedPrice(
          discount: double.tryParse(productDetails.discountController.text) ??
              0,
          price: int.tryParse(productDetails.originalPriceController.text) ??
              0).toString();
      setState(() {});
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (mounted) {
              Navigator.of(context).pop();
            }
          },
          icon: Icon(Icons.close),
        ),
        title: Text(
          AppString.addProduct,
          style: AppTextStyle.style(
            fontWeight: .semiBold,
            fontSize: 18,
            height: 1.335,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.help_outline),
              tooltip: AppString.tooltipText,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    AppString.productImages,
                    style: AppTextStyle.style(
                      fontSize: 16,
                      fontWeight: .semiBold,
                      height: 1.35,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    AppString.uploadImagesDescription,
                    style: AppTextStyle.style(
                      color: AppColor.textLabelColor,
                      height: 1.35,
                    ),
                  ),
                  SizedBox(height: 12),

                  SizedBox(
                    height: 95,
                    child: ListView.separated(
                      shrinkWrap: true,
                      clipBehavior: .none,
                      scrollDirection: .horizontal,

                      itemBuilder: (context, index) {
                        var imageList = productDetails.productImages;

                        if (index == imageList.length && imageList.length < 7) {
                          return GestureDetector(
                            onTap: () async {
                              String? selectedImage =
                              await pickImageFromGallery();
                              if (selectedImage != null) {
                                setState(() {
                                  imageList.add(selectedImage);
                                });
                              }
                            },
                            child: Container(
                              color: Colors.white,
                              margin: .all(10),
                              child: DottedBorder(
                                options: RoundedRectDottedBorderOptions(
                                  radius: .circular(12),
                                  color: AppColor.backgroundGray,
                                  strokeWidth: 2,
                                  dashPattern: [7, 6],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(25),
                                  child: Icon(
                                    Icons.add_photo_alternate_outlined,
                                    color: AppColor.textLabelColor,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                String? selectedImage = await pickImageFromGallery();
                                if (selectedImage != null) {
                                  setState(() {
                                    imageList[index] = selectedImage;
                                  });
                                }
                              },
                              child: Container(
                                margin: .all(10),
                                child: CommonImageView(
                                  containerHeight: double.infinity,
                                  containerWidth: 80,
                                  networkImageSource: productDetails
                                      .productImages[index],
                                  isLocalImage: true,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  imageList.removeAt(index);
                                  setState(() {});
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: AppColor.backgroundRedColor,
                                    shape: .circle,
                                  ),
                                  child: Center(
                                      child: Icon(Icons.close, size: 14)),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 13);
                      },
                      itemCount: productDetails.productImages.length < 7
                          ? productDetails.productImages.length + 1
                          : productDetails.productImages.length,
                    ),
                  ),
                  SizedBox(height: 24),

                  Divider(height: 1, color: AppColor.backgroundGray),
                  SizedBox(height: 24),

                  PaddedLabel(label: AppString.productTitle, isRequired: true),
                  SizedBox(height: 4),
                  CommonInputField(
                    textController: productDetails.productTitleController,
                    hintText: AppString.productTitleHintText,
                    validatorFunction: (value){
                      if(value?.trim() == "" || value == null){
                        return "Title is required";
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 16),

                  PaddedLabel(label: AppString.productDescriptionLabel),
                  SizedBox(height: 4),
                  CommonTextArea(
                    textController: productDetails.descriptionController,
                    hintText: AppString.descriptionHintText,
                    isTextArea: true,
                    minLines: 3,
                    maxLines: 3,
                  ),

                  SizedBox(height: 24),
                  Divider(height: 1, color: AppColor.backgroundGray),
                  SizedBox(height: 24),

                  Row(
                    spacing: 16,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            PaddedLabel(label: AppString.originalPrice),
                            SizedBox(height: 4),
                            CommonInputField(
                              textController:
                              productDetails.originalPriceController,
                              onChanged: _calculatePrice,
                              hintText: AppString.originalPriceHintText,
                              prefixIcon: Icon(
                                Icons.attach_money_outlined,
                                size: 15,
                                color: AppColor.textLabelColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            PaddedLabel(label: AppString.discount),
                            SizedBox(height: 4),
                            CommonInputField(
                              textController: productDetails.discountController,
                              onChanged: _calculatePrice,
                              hintText: AppString.discountHintText,
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.percent,
                                  size: 15,
                                  color: AppColor.textLabelColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  Container(
                    padding: const EdgeInsetsGeometry.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColorWithOpacity,
                      borderRadius: .circular(8),
                      border: BoxBorder.all(
                        color: AppColor.primaryColor,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: .min,
                      spacing: 8,
                      children: [
                        Icon(
                          Icons.local_offer_outlined,
                          color: AppColor.primaryColor,
                          size: 16,
                        ),
                        Text(
                          "${AppString.finalPrice}: \$${productDetails.sellingPrice ?? ""}",
                          style: AppTextStyle.style(
                            fontSize: 16,
                            fontWeight: .semiBold,
                            height: 1.35,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),

                  Divider(height: 1, color: AppColor.backgroundGray),
                  SizedBox(height: 24),

                  PaddedLabel(label: AppString.category),
                  SizedBox(height: 4),
                  ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButtonFormField(
                      initialValue: AppString.categoriesList[0]
                          .trim()
                          .toLowerCase(),
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Icon(Icons.keyboard_arrow_down),
                      ),
                      items: AppString.categoriesList
                          .toSet()
                          .map(
                            (category) =>
                            DropdownMenuItem(
                              value: category.trim().toLowerCase(),
                              child: Text(
                                category,
                                style: AppTextStyle.style(
                                  color: AppColor.textPrimaryColor,
                                  height: 1.425,
                                ),
                              ),
                            ),
                      )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          productDetails.category = value;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColor.backgroundGray),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColor.backgroundGray),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  PaddedLabel(label: AppString.inventoryStock),
                  SizedBox(height: 4),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: .circular(12),
                      border: BoxBorder.all(
                        color: AppColor.backgroundGray,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: .min,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (productDetails.inventoryStock! > 1) {
                              setState(() {
                                productDetails.inventoryStock =
                                    productDetails.inventoryStock! - 1;
                              });
                            }
                          },
                          icon: Icon(Icons.horizontal_rule, size: 22),
                        ),
                        SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            color: AppColor.backgroundGrayWithOpacity,
                            thickness: 1,
                            width: 1,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 22,
                          ),
                          color: AppColor.backgroundWhite,
                          child: Text(
                            productDetails.inventoryStock.toString(),
                            style: AppTextStyle.style(
                              fontSize: 16,
                              height: 1.375,
                              fontWeight: .semiBold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            color: AppColor.backgroundGrayWithOpacity,
                            thickness: 1,
                            width: 1,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              productDetails.inventoryStock =
                                  productDetails.inventoryStock! + 1;
                            });
                          },
                          icon: Icon(Icons.add, size: 22),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          right: 20,
          left: 20,
          top: 20,
          bottom: MediaQuery
              .paddingOf(context)
              .bottom,
        ),
        child: TextButton.icon(
          onPressed: () {
            if(_formKey.currentState!.validate()){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Form Validated."))
              );
            }
          },
          label: Text(
            AppString.saveProduct,
            style: AppTextStyle.style(
              fontWeight: .semiBold,
              fontSize: 16,
              height: 1.375,
              color: Colors.white,
            ),
          ),
          icon: Icon(Icons.save_outlined),
          style: TextButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: .circular(12)),
          ),
        ),
      ),
    );
  }
}