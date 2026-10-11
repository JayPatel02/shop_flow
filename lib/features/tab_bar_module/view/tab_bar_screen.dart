import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_routes.dart';
import 'package:shop_flow/core/constants/app_string.dart';
import 'package:shop_flow/core/constants/app_text_style.dart';
import 'package:shop_flow/core/widgets/common_header.dart';
import 'package:shop_flow/features/cart_module/cart_screen/view/card_screen_view.dart';
import 'package:shop_flow/features/home_screen_module/home_screen/view/home_screen_view.dart';
import 'package:shop_flow/features/product_module/product_listing/view/products_listing_screen_view.dart';
import 'package:shop_flow/features/profile_module/profile_screen/view/profile_screen_view.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      setState(() {
        _activeIndex = _tabController.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeScreen(),
          CardScreenView(),
          ProductListingScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          controller: _tabController,
          indicatorSize: .tab,
          splashBorderRadius: .zero,
          indicator: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: .circular(12),
          ),
          dividerColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          labelColor: Colors.white,
          unselectedLabelColor: AppColor.textLabelColor,
          tabs: [
            Tab(
              text: AppString.home,
              icon: Icon(_activeIndex == 0 ? Icons.home : Icons.home_outlined),
            ),
            Stack(
              children: [
                Tab(
                  text: AppString.cart,
                  icon: Icon(
                    _activeIndex == 1
                        ? Icons.shopping_cart
                        : Icons.shopping_cart_outlined,
                  ),
                ),
                Positioned(
                  top: 2,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColor.primaryRedColor,
                      shape: .circle
                    ),
                    child: Center(
                      child: Text(
                        "2",
                        style: AppTextStyle.style(
                          fontSize: 10,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Tab(
              text: AppString.product,
              icon: Icon(
                _activeIndex == 2
                    ? Icons.inventory_2
                    : Icons.inventory_2_outlined,
              ),
            ),
            Tab(
              text: AppString.profile,
              icon: Icon(
                _activeIndex == 3 ? Icons.person : Icons.person_outline,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _activeIndex == 2
          ? FloatingActionButton(
              onPressed: () {
                if (mounted) {
                  Navigator.of(context).pushNamed(AppRoutes.addProduct);
                }
              },
              backgroundColor: AppColor.primaryColor,
              foregroundColor: Colors.white,
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}
