class AddressModel {
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLang;

  AddressModel(
      {this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLang});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLang = json['address_lang'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['address_id'] = this.addressId;
  //   data['address_usersid'] = this.addressUsersid;
  //   data['address_name'] = this.addressName;
  //   data['address_city'] = this.addressCity;
  //   data['address_street'] = this.addressStreet;
  //   data['address_lat'] = this.addressLat;
  //   data['address_lang'] = this.addressLang;
  //   return data;
  // }
}
