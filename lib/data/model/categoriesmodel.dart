class CategoriesModel {
  String? categoiresId;
  String? categoiresName;
  String? categoiresNameAr;
  String? categoiresImage;
  String? categoiresDatetime;

  CategoriesModel(
      {this.categoiresId,
      this.categoiresName,
      this.categoiresNameAr,
      this.categoiresImage,
      this.categoiresDatetime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoiresId = json['categoires_id'];
    categoiresName = json['categoires_name'];
    categoiresNameAr = json['categoires_name_ar'];
    categoiresImage = json['categoires_image'];
    categoiresDatetime = json['categoires_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoires_id'] = this.categoiresId;
    data['categoires_name'] = this.categoiresName;
    data['categoires_name_ar'] = this.categoiresNameAr;
    data['categoires_image'] = this.categoiresImage;
    data['categoires_datetime'] = this.categoiresDatetime;
    return data;
  }
}
