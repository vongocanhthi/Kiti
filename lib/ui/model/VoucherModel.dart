class VoucherModel {
  int? count;
  List<Data>? data;

  VoucherModel({this.count, this.data});

  VoucherModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? affLink;
  Null? affLinkCampaignTag;
  List<Null>? banner;
  String? campaign;
  String? campaignId;
  String? campaignName;
  List<Categories>? categories;
  int? coinCap;
  int? coinPercentage;
  String? content;
  List<Coupons>? coupons;
  int? discountPercentage;
  int? discountValue;
  String? domain;
  String? endTime;
  String? id;
  String? image;
  String? isHot;
  List<String>? keyword;
  String? link;
  int? maxValue;
  String? merchant;
  int? minSpend;
  String? name;
  int? priorType;
  int? remain;
  bool? remainTrue;
  int? shopId;
  String? startTime;
  int? status;
  String? timeLeft;

  Data(
      {this.affLink,
      this.affLinkCampaignTag,
      this.banner,
      this.campaign,
      this.campaignId,
      this.campaignName,
      this.categories,
      this.coinCap,
      this.coinPercentage,
      this.content,
      this.coupons,
      this.discountPercentage,
      this.discountValue,
      this.domain,
      this.endTime,
      this.id,
      this.image,
      this.isHot,
      this.keyword,
      this.link,
      this.maxValue,
      this.merchant,
      this.minSpend,
      this.name,
      this.priorType,
      this.remain,
      this.remainTrue,
      this.shopId,
      this.startTime,
      this.status,
      this.timeLeft});

  Data.fromJson(Map<String, dynamic> json) {
    affLink = json['aff_link'];
    affLinkCampaignTag = json['aff_link_campaign_tag'];
    if (json['banner'] != null) {
      banner = <Null>[];
      json['banner'].forEach((v) {
        banner!.add(null);
      });
    }
    campaign = json['campaign'];
    campaignId = json['campaign_id'];
    campaignName = json['campaign_name'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    coinCap = json['coin_cap'];
    coinPercentage = json['coin_percentage'];
    content = json['content'];
    if (json['coupons'] != null) {
      coupons = <Coupons>[];
      json['coupons'].forEach((v) {
        coupons!.add(new Coupons.fromJson(v));
      });
    }
    discountPercentage = json['discount_percentage'];
    discountValue = json['discount_value'];
    domain = json['domain'];
    endTime = json['end_time'];
    id = json['id'];
    image = json['image'];
    isHot = json['is_hot'];
    keyword = json['keyword'].cast<String>();
    link = json['link'];
    maxValue = json['max_value'];
    merchant = json['merchant'];
    minSpend = json['min_spend'];
    name = json['name'];
    priorType = json['prior_type'];
    remain = json['remain'];
    remainTrue = json['remain_true'];
    shopId = json['shop_id'];
    startTime = json['start_time'];
    status = json['status'];
    timeLeft = json['time_left'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aff_link'] = this.affLink;
    data['aff_link_campaign_tag'] = this.affLinkCampaignTag;
    if (this.banner != null) {
      data['banner'] = this.banner!.map((v) => v).toList();
    }
    data['campaign'] = this.campaign;
    data['campaign_id'] = this.campaignId;
    data['campaign_name'] = this.campaignName;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['coin_cap'] = this.coinCap;
    data['coin_percentage'] = this.coinPercentage;
    data['content'] = this.content;
    if (this.coupons != null) {
      data['coupons'] = this.coupons!.map((v) => v.toJson()).toList();
    }
    data['discount_percentage'] = this.discountPercentage;
    data['discount_value'] = this.discountValue;
    data['domain'] = this.domain;
    data['end_time'] = this.endTime;
    data['id'] = this.id;
    data['image'] = this.image;
    data['is_hot'] = this.isHot;
    data['keyword'] = this.keyword;
    data['link'] = this.link;
    data['max_value'] = this.maxValue;
    data['merchant'] = this.merchant;
    data['min_spend'] = this.minSpend;
    data['name'] = this.name;
    data['prior_type'] = this.priorType;
    data['remain'] = this.remain;
    data['remain_true'] = this.remainTrue;
    data['shop_id'] = this.shopId;
    data['start_time'] = this.startTime;
    data['status'] = this.status;
    data['time_left'] = this.timeLeft;
    return data;
  }
}

class Categories {
  String? categoryName;
  String? categoryNameShow;
  String? categoryNo;

  Categories({this.categoryName, this.categoryNameShow, this.categoryNo});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    categoryNameShow = json['category_name_show'];
    categoryNo = json['category_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_name'] = this.categoryName;
    data['category_name_show'] = this.categoryNameShow;
    data['category_no'] = this.categoryNo;
    return data;
  }
}

class Coupons {
  String? couponCode;
  String? couponDesc;

  Coupons({this.couponCode, this.couponDesc});

  Coupons.fromJson(Map<String, dynamic> json) {
    couponCode = json['coupon_code'];
    couponDesc = json['coupon_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_code'] = this.couponCode;
    data['coupon_desc'] = this.couponDesc;
    return data;
  }
}
