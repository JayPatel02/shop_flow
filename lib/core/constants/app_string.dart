import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_color.dart';
import 'package:shop_flow/core/constants/app_routes.dart';

class AppString {
  // splash screen
  static String brandName = "ShopFlow";
  static String description = "Elevating your retail experience.";
  static String loaderText = "Loading experience...";

  // intro screen
  static String next = "Next";
  static String getStarted = "Get Started";
  static String skip = "Skip";

  // login screen
  static String welcomeBack = "Welcome Back";
  static String username = "Username";
  static String password = "Password";
  static String demoString = "Use Demo Account";

  // tab view
  static String home = "Home";
  static String cart = "Cart";
  static String product = "Products";
  static String profile = "Profile";

  // dummy image
  static String dummyImage = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1PWChN3VkiwELJ_pXhCScb76FheIGMZ53j7T7wQKbOlZ59I5szPVMc9Sc&s=10";
  static String dummyColor = "Midnight Blue";

  // Shared preference
  static String isIntroScreenShown = "isIntroScreenShown";

  // product details
  static String inStock = "In Stock";
  static String quantity = "Quantity";
  static String productDescription = "Product Description";
  static String customersReview = "Customer Reviews";
  static String viewAllReviews = "View All Reviews";
  static String viewLessReviews = "View Less Reviews";
  static String totalPrice = "Total Price";
  static String addToCart = "Add to Cart";

  // cart screen
  static String yourCart = "Your Cart";
  static String item = "item";
  static String yourCartIsEmpty = "Your cart is empty";
  static String cartEmptyDescription =
      "Looks like you haven't added anything to your cart yet.";
  static String startShopping = "Start Shopping";
  static String proceedToCheckout = "Proceed To Checkout";

  // product listing
  static String myProducts = "My Products";
  static String products = "Products";
  static String active = "Active";
  static String draft = "Draft";

  // add product
  static String addProduct = "Add Product";
  static String saveProduct = "Save Product";
  static String productImages = "Product Images";
  static String uploadImagesDescription = "Upload up to 7 high-quality images.";
  static String productTitle = "Product Title";
  static String productDescriptionLabel = "Description";
  static String originalPrice = "Original Price";
  static String discount = "Discount %";
  static String category = "Category";
  static String inventoryStock = "Inventory Stock";
  static String finalPrice = "Final Price";
  static String tooltipText =
      "Tooltips provide text labels which help explain the function of a button or other user interface action. Wrap the button in a Tooltip widget and provide a message which will be shown when the widget is long pressed.Many widgets, such as IconButton, FloatingActionButton, and PopupMenuButton have a tooltip property that, when non-null, causes the widget to include a Tooltip in its build.";

  static List<String> categoriesList = [
    "Home & Kitchen",
    "Electronics",
    "Mobile",
  ];

  //hint Text
  static String productTitleHintText = "e.g. Minimalist Ceramic Mug";
  static String descriptionHintText =
      "Describe your product's features and benefits...";
  static String originalPriceHintText = "e.g. 10.99";
  static String discountHintText = "e.g. 10";

  // input hint text Strings
  static String inputHintText(String str) => "Enter your $str";

  // profile
  static List<Map<String, dynamic>> profileTiles = [
    {
      "icon": Icon(Icons.person_outline, color: AppColor.primaryColor),
      "header": "Edit Profile",
    },
    {
      "icon": Icon(Icons.dashboard, color: AppColor.primaryColor),
      "header": "Seller Dashboard",
    },
    {
      "icon": Icon(Icons.location_on_outlined, color: AppColor.primaryColor),
      "header": "Addresses",
    },
    {
      "icon": Icon(Icons.notifications_outlined, color: AppColor.primaryColor),
      "header": "Notification",
    },
    {
      "icon": Icon(Icons.help, color: AppColor.primaryColor),
      "header": "Help & Support",
    },
  ];

  static String logout = "Log Out";

  // seller Dashboard
  static String sellerDashboard = "Seller Dashboard";
  static String dashboardOverview =
      "Overview of your store's performance today.";
  static String categoryBreakdownLabel = "Category Breakdown";
  static String stockLevels = "Stock Levels";
  static String viewDetails = "View Details";
  static String topRatedProduct = "Top Rated Product";

  static Map<String, dynamic> stockLevelsData = {
    "Smartphone": {"value": 3200, "color": AppColor.primaryColor},
    "Laptops": {"value": 1850, "color": AppColor.secondaryColor},
    "Accessories": {"value": 2400, "color": AppColor.violetHeaven},
    "Audio Devices": {"value": 120, "color": AppColor.starColor},
  };

  static Map<String, dynamic> categoryBreakdown = {
    "Electronics": {"percentage": 45, "color": AppColor.primaryColor},
    "Clothing": {"percentage": 30, "color": AppColor.starColor},
    "Home Goods": {"percentage": 15, "color": AppColor.bolognese},
    "Others": {"percentage": 10, "color": AppColor.homeopathicLavender},
  };

}
