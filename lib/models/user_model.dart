class UserModel {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  UserModel(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  UserModel.fromJson(Map<String, dynamic> json) {
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
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
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
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
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
  Null? membershipId;
  Null? membershipStatus;
  Null? membershipExpiry;
  Null? lifeMember;
  Null? memberTypeId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? dob;
  String? name;
  Null? address;
  Null? address2;
  Null? experience;
  Null? service;
  String? country;
  String? city;
  int? companyId;
  String? prefix;
  Null? classType;
  String? altEmail;
  String? cnic;
  String? vaccination;
  String? userType;
  int? isVerified;
  int? isActive;
  int? isLogin;
  String? image;
  String? coverImage;
  Null? groupId;
  Null? website;
  Null? postal;
  Null? brief;
  Null? passwordReset;
  Null? passwordRand;
  String? emergency;
  String? contactData;
  String? sponsoring;
  String? createdAt;
  String? updatedAt;
  Null? secret;
  Null? fbToken;
  String? gender;
  Null? deletedAt;

  Data(
      {this.id,
      this.membershipId,
      this.membershipStatus,
      this.membershipExpiry,
      this.lifeMember,
      this.memberTypeId,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.dob,
      this.name,
      this.address,
      this.address2,
      this.experience,
      this.service,
      this.country,
      this.city,
      this.companyId,
      this.prefix,
      this.classType,
      this.altEmail,
      this.cnic,
      this.vaccination,
      this.userType,
      this.isVerified,
      this.isActive,
      this.isLogin,
      this.image,
      this.coverImage,
      this.groupId,
      this.website,
      this.postal,
      this.brief,
      this.passwordReset,
      this.passwordRand,
      this.emergency,
      this.contactData,
      this.sponsoring,
      this.createdAt,
      this.updatedAt,
      this.secret,
      this.fbToken,
      this.gender,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    membershipId = json['membership_id'];
    membershipStatus = json['membership_status'];
    membershipExpiry = json['membership_expiry'];
    lifeMember = json['life_member'];
    memberTypeId = json['member_type_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    dob = json['dob'];
    name = json['name'];
    address = json['address'];
    address2 = json['address2'];
    experience = json['experience'];
    service = json['service'];
    country = json['country'];
    city = json['city'];
    companyId = json['company_id'];
    prefix = json['prefix'];
    classType = json['class_type'];
    altEmail = json['alt_email'];
    cnic = json['cnic'];
    vaccination = json['vaccination'];
    userType = json['user_type'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
    isLogin = json['is_login'];
    image = json['image'];
    coverImage = json['cover_image'];
    groupId = json['group_id'];
    website = json['website'];
    postal = json['postal'];
    brief = json['brief'];
    passwordReset = json['password_reset'];
    passwordRand = json['password_rand'];
    emergency = json['emergency'];
    contactData = json['contact_data'];
    sponsoring = json['sponsoring'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    secret = json['secret'];
    fbToken = json['fb_token'];
    gender = json['gender'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['membership_id'] = this.membershipId;
    data['membership_status'] = this.membershipStatus;
    data['membership_expiry'] = this.membershipExpiry;
    data['life_member'] = this.lifeMember;
    data['member_type_id'] = this.memberTypeId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['dob'] = this.dob;
    data['name'] = this.name;
    data['address'] = this.address;
    data['address2'] = this.address2;
    data['experience'] = this.experience;
    data['service'] = this.service;
    data['country'] = this.country;
    data['city'] = this.city;
    data['company_id'] = this.companyId;
    data['prefix'] = this.prefix;
    data['class_type'] = this.classType;
    data['alt_email'] = this.altEmail;
    data['cnic'] = this.cnic;
    data['vaccination'] = this.vaccination;
    data['user_type'] = this.userType;
    data['is_verified'] = this.isVerified;
    data['is_active'] = this.isActive;
    data['is_login'] = this.isLogin;
    data['image'] = this.image;
    data['cover_image'] = this.coverImage;
    data['group_id'] = this.groupId;
    data['website'] = this.website;
    data['postal'] = this.postal;
    data['brief'] = this.brief;
    data['password_reset'] = this.passwordReset;
    data['password_rand'] = this.passwordRand;
    data['emergency'] = this.emergency;
    data['contact_data'] = this.contactData;
    data['sponsoring'] = this.sponsoring;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['secret'] = this.secret;
    data['fb_token'] = this.fbToken;
    data['gender'] = this.gender;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}