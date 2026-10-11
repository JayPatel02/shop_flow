class ProductDetailModal {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  Category? category;
  String? brandName;
  num? discount;
  num? avgRating;
  int? totalRating;
  int? stock;
  List<CustomerReviews>? reviews;
  List<String>? images;
  bool? isFavourite;
  int? quantity;
  String? creationAt;
  String? updatedAt;

  ProductDetailModal({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.reviews,
    this.isFavourite = false,
    this.quantity = 1,
    this.discount = 0,
    this.brandName,
    this.avgRating,
    this.totalRating,
    this.stock = 0
  });

  ProductDetailModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['price'] = price;
    data['description'] = description;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['images'] = images;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class CustomerReviews {
  int? id;
  String? name;
  String? slug;
  String? profileImage;
  String? reviewText;
  String? creationAt;
  num? rating;

  CustomerReviews({
    this.id,
    this.name,
    this.slug,
    this.profileImage,
    this.creationAt,
    this.rating,
    this.reviewText
  });

  CustomerReviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    profileImage = json['profileImage'];
    creationAt = json['creationAt'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = profileImage;
    data['creationAt'] = creationAt;
    data['rating'] = rating;
    return data;
  }
}
