class BlogModel {
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

  BlogModel(
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

  BlogModel.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  Null? categoryId;
  String? title;
  String? slug;
  String? shortDescription;
  String? description;
  String? image;
  Null? imageExt;
  String? isActive;
  String? views;
  Null? time;
  String? likes;
  Null? ip;
  Null? customPostType;
  Null? postAttributes;
  String? isFeatured;
  Null? sortOrder;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.categoryId,
      this.title,
      this.slug,
      this.shortDescription,
      this.description,
      this.image,
      this.imageExt,
      this.isActive,
      this.views,
      this.time,
      this.likes,
      this.ip,
      this.customPostType,
      this.postAttributes,
      this.isFeatured,
      this.sortOrder,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    title = json['title'];
    slug = json['slug'];
    shortDescription = json['short_description'];
    description = json['description'];
    image = json['image'];
    imageExt = json['image_ext'];
    isActive = json['is_active'];
    views = json['views'];
    time = json['time'];
    likes = json['likes'];
    ip = json['ip'];
    customPostType = json['custom_post_type'];
    postAttributes = json['post_attributes'];
    isFeatured = json['is_featured'];
    sortOrder = json['sort_order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['image'] = this.image;
    data['image_ext'] = this.imageExt;
    data['is_active'] = this.isActive;
    data['views'] = this.views;
    data['time'] = this.time;
    data['likes'] = this.likes;
    data['ip'] = this.ip;
    data['custom_post_type'] = this.customPostType;
    data['post_attributes'] = this.postAttributes;
    data['is_featured'] = this.isFeatured;
    data['sort_order'] = this.sortOrder;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}