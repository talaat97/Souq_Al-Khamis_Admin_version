class ItemModel {
  String? iteamsId;
  String? iteamsName;
  String? iteamsNameAr;
  String? iteamsDec;
  String? iteamsDecAr;
  String? iteamsImage;
  String? iteamsCount;
  String? iteamsActive;
  String? iteamsPrice;
  String? iteamsDiscount;
  String? iteamsDate;
  String? iteamsCat;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;

  ItemModel(
      {this.iteamsId,
      this.iteamsName,
      this.iteamsNameAr,
      this.iteamsDec,
      this.iteamsDecAr,
      this.iteamsImage,
      this.iteamsCount,
      this.iteamsActive,
      this.iteamsPrice,
      this.iteamsDiscount,
      this.iteamsDate,
      this.iteamsCat,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatetime});

  ItemModel.fromJson(Map<String, dynamic> json) {
    iteamsId = json['iteams_id'];
    iteamsName = json['iteams_name'];
    iteamsNameAr = json['iteams_name_ar'];
    iteamsDec = json['iteams_dec'];
    iteamsDecAr = json['iteams_dec_ar'];
    iteamsImage = json['iteams_image'];
    iteamsCount = json['iteams_count'];
    iteamsActive = json['iteams_active'];
    iteamsPrice = json['iteams_price'];
    iteamsDiscount = json['iteams_discount'];
    iteamsDate = json['iteams_date'];
    iteamsCat = json['iteams_cat'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
  }
}
