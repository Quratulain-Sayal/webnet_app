
class PagesModel {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  PagesModel(
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

  PagesModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? slug;
  int? isDefault;
  Null? meta;
  String? metaTitle;
  Null? metaDesc;
  Null? metaKeywords;
  String? createdAt;
  String? updatedAt;
  Seo? seo;
  Null? sliderId;
  Null? headerImage;
  String? customCss;
  Null? isStore;
  int? isHome;
  int? isActive;
  Null? deletedAt;

  Data(
      {this.id,
      this.title,
      this.slug,
      this.isDefault,
      this.meta,
      this.metaTitle,
      this.metaDesc,
      this.metaKeywords,
      this.createdAt,
      this.updatedAt,
      this.seo,
      this.sliderId,
      this.headerImage,
      this.customCss,
      this.isStore,
      this.isHome,
      this.isActive,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    isDefault = json['is_default'];
    meta = json['meta'];
    metaTitle = json['meta_title'];
    metaDesc = json['meta_desc'];
    metaKeywords = json['meta_keywords'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    seo = json['seo'] != null ? new Seo.fromJson(json['seo']) : null;
    sliderId = json['slider_id'];
    headerImage = json['header_image'];
    customCss = json['custom_css'];
    isStore = json['is_store'];
    isHome = json['is_home'];
    isActive = json['is_active'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['is_default'] = this.isDefault;
    data['meta'] = this.meta;
    data['meta_title'] = this.metaTitle;
    data['meta_desc'] = this.metaDesc;
    data['meta_keywords'] = this.metaKeywords;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.seo != null) {
      data['seo'] = this.seo!.toJson();
    }
    data['slider_id'] = this.sliderId;
    data['header_image'] = this.headerImage;
    data['custom_css'] = this.customCss;
    data['is_store'] = this.isStore;
    data['is_home'] = this.isHome;
    data['is_active'] = this.isActive;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Seo {
  String? showMeta;
  String? showCanonical;
  String? showOg;
  String? showTwitter;
  String? metaTitle;
  Null? metaKeywords;
  String? metaDescription;
  List<String>? canonical;
  String? ogTitle;
  String? ogUrl;
  Null? ogType;
  String? ogImage;
  String? ogDescription;
  String? twitterTitle;
  String? twitterUrl;
  Null? twitterCard;
  String? twitterImage;
  String? twitterDescription;
  Null? scripts;
  String? showBreadcrumb;

  Seo(
      {this.showMeta,
      this.showCanonical,
      this.showOg,
      this.showTwitter,
      this.metaTitle,
      this.metaKeywords,
      this.metaDescription,
      this.canonical,
      this.ogTitle,
      this.ogUrl,
      this.ogType,
      this.ogImage,
      this.ogDescription,
      this.twitterTitle,
      this.twitterUrl,
      this.twitterCard,
      this.twitterImage,
      this.twitterDescription,
      this.scripts,
      this.showBreadcrumb});

  Seo.fromJson(Map<String, dynamic> json) {
    showMeta = json['show_meta'];
    showCanonical = json['show_canonical'];
    showOg = json['show_og'];
    showTwitter = json['show_twitter'];
    metaTitle = json['meta_title'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    canonical = json['canonical'].cast<String>();
    ogTitle = json['og_title'];
    ogUrl = json['og_url'];
    ogType = json['og_type'];
    ogImage = json['og_image'];
    ogDescription = json['og_description'];
    twitterTitle = json['twitter_title'];
    twitterUrl = json['twitter_url'];
    twitterCard = json['twitter_card'];
    twitterImage = json['twitter_image'];
    twitterDescription = json['twitter_description'];
    scripts = json['scripts'];
    showBreadcrumb = json['show_breadcrumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['show_meta'] = this.showMeta;
    data['show_canonical'] = this.showCanonical;
    data['show_og'] = this.showOg;
    data['show_twitter'] = this.showTwitter;
    data['meta_title'] = this.metaTitle;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['canonical'] = this.canonical;
    data['og_title'] = this.ogTitle;
    data['og_url'] = this.ogUrl;
    data['og_type'] = this.ogType;
    data['og_image'] = this.ogImage;
    data['og_description'] = this.ogDescription;
    data['twitter_title'] = this.twitterTitle;
    data['twitter_url'] = this.twitterUrl;
    data['twitter_card'] = this.twitterCard;
    data['twitter_image'] = this.twitterImage;
    data['twitter_description'] = this.twitterDescription;
    data['scripts'] = this.scripts;
    data['show_breadcrumb'] = this.showBreadcrumb;
    return data;
  }
}

