class CustomerModel {
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

  CustomerModel(
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

  CustomerModel.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? dob;
  String? address;
  String? country;
  String? city;
  String? postal;
  ShippingMeta? shippingMeta;
  BillingMeta? billingMeta;
  String? userType;
  Null? brief;
  int? isVerified;
  int? isActive;
  int? isPassChanged;
  Null? groupId;
  Null? talentlmsId;
  Null? image;
  String? createdAt;
  String? updatedAt;
  String? secret;
  Null? provider;
  Null? fbToken;
  Null? deletedAt;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.dob,
      this.address,
      this.country,
      this.city,
      this.postal,
      this.shippingMeta,
      this.billingMeta,
      this.userType,
      this.brief,
      this.isVerified,
      this.isActive,
      this.isPassChanged,
      this.groupId,
      this.talentlmsId,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.secret,
      this.provider,
      this.fbToken,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    dob = json['dob'];
    address = json['address'];
    country = json['country'];
    city = json['city'];
    postal = json['postal'];
    shippingMeta = json['shipping_meta'] != null
        ? new ShippingMeta.fromJson(json['shipping_meta'])
        : null;
    billingMeta = json['billing_meta'] != null
        ? new BillingMeta.fromJson(json['billing_meta'])
        : null;
    userType = json['user_type'];
    brief = json['brief'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
    isPassChanged = json['is_pass_changed'];
    groupId = json['group_id'];
    talentlmsId = json['talentlms_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    secret = json['secret'];
    provider = json['provider'];
    fbToken = json['fb_token'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['dob'] = this.dob;
    data['address'] = this.address;
    data['country'] = this.country;
    data['city'] = this.city;
    data['postal'] = this.postal;
    if (this.shippingMeta != null) {
      data['shipping_meta'] = this.shippingMeta!.toJson();
    }
    if (this.billingMeta != null) {
      data['billing_meta'] = this.billingMeta!.toJson();
    }
    data['user_type'] = this.userType;
    data['brief'] = this.brief;
    data['is_verified'] = this.isVerified;
    data['is_active'] = this.isActive;
    data['is_pass_changed'] = this.isPassChanged;
    data['group_id'] = this.groupId;
    data['talentlms_id'] = this.talentlmsId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['secret'] = this.secret;
    data['provider'] = this.provider;
    data['fb_token'] = this.fbToken;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class ShippingMeta {
  String? country;
  String? city;
  String? postal;
  String? address;

  ShippingMeta({this.country, this.city, this.postal, this.address});

  ShippingMeta.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['city'];
    postal = json['postal'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['city'] = this.city;
    data['postal'] = this.postal;
    data['address'] = this.address;
    return data;
  }
}

class BillingMeta {
  String? firstName;
  String? lastName;
  String? country;
  String? city;
  String? postal;
  String? phone;
  String? address;

  BillingMeta(
      {this.firstName,
      this.lastName,
      this.country,
      this.city,
      this.postal,
      this.phone,
      this.address});

  BillingMeta.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    country = json['country'];
    city = json['city'];
    postal = json['postal'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['country'] = this.country;
    data['city'] = this.city;
    data['postal'] = this.postal;
    data['phone'] = this.phone;
    data['address'] = this.address;
    return data;
  }
}