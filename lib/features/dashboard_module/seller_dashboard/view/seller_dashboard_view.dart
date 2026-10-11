import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_string.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/core/widgets/common_header.dart';
import 'package:shop_flow/features/dashboard_module/seller_dashboard/widgets/category_breakdown_row.dart';
import 'package:shop_flow/features/dashboard_module/seller_dashboard/widgets/stats_card.dart';
import 'package:shop_flow/features/dashboard_module/seller_dashboard/widgets/stock_level_row.dart';

class SellerDashboardView extends StatelessWidget {
  List<Map<String, dynamic>> topRatedProducts = [
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1PWChN3VkiwELJ_pXhCScb76FheIGMZ53j7T7wQKbOlZ59I5szPVMc9Sc&s=10",
      "productName": "Product Name",
      "rating": "4.8",
      "totalReview": "120",
      "sellingPrice": "299",
      "quantity": "15",
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1PWChN3VkiwELJ_pXhCScb76FheIGMZ53j7T7wQKbOlZ59I5szPVMc9Sc&s=10",
      "productName": "Product Name",
      "rating": "4.8",
      "totalReview": "120",
      "sellingPrice": "299",
      "quantity": "15",
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1PWChN3VkiwELJ_pXhCScb76FheIGMZ53j7T7wQKbOlZ59I5szPVMc9Sc&s=10",
      "productName": "Product Name",
      "rating": "4.8",
      "totalReview": "120",
      "sellingPrice": "299",
      "quantity": "15",
    },
  ];

  SellerDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(isBack: true),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsetsGeometry.symmetric(
            vertical: 24,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                AppString.sellerDashboard,
                style: AppTextStyle.style(
                  color: AppColor.textPrimaryColor,
                  fontSize: 18,
                  height: 1.335,
                  fontWeight: .semiBold,
                ),
              ),
              SizedBox(height: 12),

              Text(
                AppString.dashboardOverview,
                style: AppTextStyle.style(color: AppColor.textLabelColor),
              ),
              SizedBox(height: 32),

              StatsCard(
                headerIcon: Icon(
                  Icons.inventory_2_outlined,
                  color: AppColor.primaryColor,
                ),
                headerIconBackGroundColor: AppColor.secondaryColorWithOpacity,
                isIncreasing: true,
                headerStatData: "10",
                heading: "heading",
                data: "1,234",
              ),
              SizedBox(height: 16),

              StatsCard(
                headerIcon: Icon(
                  Icons.stacked_bar_chart_sharp,
                  color: AppColor.oregon,
                ),
                headerIconBackGroundColor: AppColor.bolognese.withAlpha(45),
                isIncreasing: false,
                headerStatData: "0",
                heading: "heading",
                data: "1,234",
              ),
              SizedBox(height: 16),

              StatsCard(
                headerIcon: Icon(
                  Icons.star_border_outlined,
                  color: AppColor.primaryRedColor,
                ),
                headerIconBackGroundColor: AppColor.starColor.withAlpha(51),
                isIncreasing: true,
                headerStatData: "10",
                heading: "heading",
                data: "4.8",
                isRating: true,
              ),
              SizedBox(height: 24),

              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: .stretch,
                    children: [
                      Text(
                        AppString.categoryBreakdownLabel,
                        style: AppTextStyle.style(
                          color: AppColor.textPrimaryColor,
                          fontSize: 18,
                          height: 1.35,
                          fontWeight: .semiBold,
                        ),
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        height: 110,
                        width: 100,
                        child: PieChart(
                          PieChartData(
                            sectionsSpace: 0,
                            centerSpaceRadius: 30,
                            sections: AppString.categoryBreakdown.entries.map((
                              entry,
                            ) {
                              return PieChartSectionData(
                                color: entry.value['color'],
                                value: entry.value['percentage'].toDouble(),
                                showTitle: false,
                                radius: 35,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      ...AppString.categoryBreakdown.entries.map((entry) {
                        return CategoryBreakdownRow(
                          label: entry.key,
                          sectionColor: entry.value['color'],
                          percentage: entry.value['percentage'].toString(),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),

              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            AppString.stockLevels,
                            style: AppTextStyle.style(
                              color: AppColor.textPrimaryColor,
                              fontSize: 18,
                              height: 1.35,
                              fontWeight: .semiBold,
                            ),
                          ),
                          Text(
                            AppString.viewDetails,
                            style: AppTextStyle.style(
                              color: AppColor.primaryColor,
                              fontSize: 12,
                              height: 1.35,
                              fontWeight: .medium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      ...AppString.stockLevelsData.entries.map((entry) {
                        return StockLevelRow(
                          label: entry.key,
                          count: entry.value['value'],
                          totalCount: 4000,
                          progressbarColor: entry.value['color'],
                        );
                      }),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32),

              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    AppString.topRatedProduct,
                    style: AppTextStyle.style(
                      fontSize: 18,
                      fontWeight: .semiBold,
                      height: 1.335,
                      color: AppColor.textPrimaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    style: ButtonStyle(tapTargetSize: .shrinkWrap),
                  ),
                ],
              ),
              SizedBox(height: 16),

              SizedBox(
                height: 280,
                child: ListView.separated(
                  scrollDirection: .horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 300,
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.only(
                                topLeft: .circular(12),
                                topRight: .circular(12)
                              ),
                              child: Image.network(
                                topRatedProducts[index]['image'],
                                fit: .cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: .start,
                                  children: [
                                    Text(
                                      topRatedProducts[index]['productName'],
                                      style: AppTextStyle.style(
                                        fontSize: 16,
                                        fontWeight: .semiBold,
                                        height: 1.35,
                                        color: AppColor.textPrimaryColor,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      mainAxisAlignment: .start,
                                      spacing: 4,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: AppColor.starColor,
                                          size: 12,
                                        ),
                                        Text(
                                          topRatedProducts[index]['rating'],
                                          style: AppTextStyle.style(
                                            fontSize: 12,
                                            fontWeight: .medium,
                                            color: AppColor.textPrimaryColor,
                                            height: 1.325,
                                          ),
                                        ),
                                        Text(
                                          "(${topRatedProducts[index]['totalReview']} reviews)",
                                          style: AppTextStyle.style(
                                            fontSize: 12,
                                            fontWeight: .medium,
                                            color: AppColor.textLabelColor,
                                            height: 1.325,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: .spaceBetween,
                                      children: [
                                        Text(
                                          "\$${topRatedProducts[index]['sellingPrice']}",
                                          style: AppTextStyle.style(
                                            fontSize: 18,
                                            fontWeight: .bold,
                                            color: AppColor.primaryColor,
                                            height: 1.325,
                                          ),
                                        ),
                                        Text(
                                          "${topRatedProducts[index]['quantity']} ${AppString.inStock.toLowerCase()}",
                                          style: AppTextStyle.style(
                                            fontSize: 12,
                                            fontWeight: .medium,
                                            color: AppColor.textLabelColor,
                                            height: 1.325,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 16);
                  },
                  itemCount: topRatedProducts.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
