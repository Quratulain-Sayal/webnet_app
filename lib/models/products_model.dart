
class ProductModel {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  ProductModel(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  ProductModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  Null? userId;
  int? categoryId;
  Null? brandId;
  String? title;
  String? slug;
  String? shortDescription;
  String? description;
  String? image;
  Null? sku;
  int? price;
  Null? discountedPrice;
  int? quantity;
  String? gallery;
  Null? discount;
  int? postType;
  String? metaKeywords;
  String? metaDescription;
  String? metaTitle;
  String? linkCanonical;
  int? isFeatured;
  String? additional;
  String? related;
  int? bestSeller;
  int? topRated;
  Null? unit;
  int? weight;
  String? variations;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.categoryId,
      this.brandId,
      this.title,
      this.slug,
      this.shortDescription,
      this.description,
      this.image,
      this.sku,
      this.price,
      this.discountedPrice,
      this.quantity,
      this.gallery,
      this.discount,
      this.postType,
      this.metaKeywords,
      this.metaDescription,
      this.metaTitle,
      this.linkCanonical,
      this.isFeatured,
      this.additional,
      this.related,
      this.bestSeller,
      this.topRated,
      this.unit,
      this.weight,
      this.variations,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    title = json['title'];
    slug = json['slug'];
    shortDescription = json['short_description'];
    description = json['description'];
    image = json['image'];
    sku = json['sku'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
    quantity = json['quantity'];
    gallery = json['gallery'];
    discount = json['discount'];
    postType = json['post_type'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    metaTitle = json['meta_title'];
    linkCanonical = json['link_canonical'];
    isFeatured = json['is_featured'];
    additional = json['additional'];
    related = json['related'];
    bestSeller = json['best_seller'];
    topRated = json['top_rated'];
    unit = json['unit'];
    weight = json['weight'];
    variations = json['variations'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['brand_id'] = this.brandId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['image'] = this.image;
    data['sku'] = this.sku;
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    data['quantity'] = this.quantity;
    data['gallery'] = this.gallery;
    data['discount'] = this.discount;
    data['post_type'] = this.postType;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['meta_title'] = this.metaTitle;
    data['link_canonical'] = this.linkCanonical;
    data['is_featured'] = this.isFeatured;
    data['additional'] = this.additional;
    data['related'] = this.related;
    data['best_seller'] = this.bestSeller;
    data['top_rated'] = this.topRated;
    data['unit'] = this.unit;
    data['weight'] = this.weight;
    data['variations'] = this.variations;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

