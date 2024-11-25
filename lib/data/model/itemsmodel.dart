class ItemsModel {
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;
  String? categoiresId;
  String? categoiresName;
  String? categoiresNameAr;
  String? categoiresImage;
  String? categoiresDatetime;
  String? favorite;
  String? itemsPriceDiscount;

  ItemsModel(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCat,
      this.itemsPriceDiscount,
      this.categoiresId,
      this.categoiresName,
      this.categoiresNameAr,
      this.categoiresImage,
      this.categoiresDatetime,
      this.favorite});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    itemsPriceDiscount = json['itemspricediscount'];
    categoiresId = json['categoires_id'];
    categoiresName = json['categoires_name'];
    categoiresNameAr = json['categoires_name_ar'];
    categoiresImage = json['categoires_image'];
    categoiresDatetime = json['categoires_datetime'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['categoires_id'] = this.categoiresId;
    data['categoires_name'] = this.categoiresName;
    data['categoires_name_ar'] = this.categoiresNameAr;
    data['categoires_image'] = this.categoiresImage;
    data['categoires_datetime'] = this.categoiresDatetime;
    data['favorite'] = this.favorite;
    return data;
  }
}
