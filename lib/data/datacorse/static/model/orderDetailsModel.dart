class OrderDetailsModel {
  String? countItems;
  String? orderId;
  String? orderUserid;
  String? orderCoupon;
  String? orderAddress;
  String? orderType;
  String? orderPriceDelivery;
  String? orderDatetime;
  String? orderPrice;
  String? orderTotalPrice;
  String? orderPaymentMethod;
  String? orderStatus;
  String? addressId;
  String? addressUserid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLang;
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
  String? cartId;
  String? cartUserid;
  String? cartItemsid;
  String? cartOrders;

  OrderDetailsModel(
      {this.countItems,
      this.orderId,
      this.orderUserid,
      this.orderCoupon,
      this.orderAddress,
      this.orderType,
      this.orderPriceDelivery,
      this.orderDatetime,
      this.orderPrice,
      this.orderTotalPrice,
      this.orderPaymentMethod,
      this.orderStatus,
      this.addressId,
      this.addressUserid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLang,
      this.iteamsId,
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
      this.cartId,
      this.cartUserid,
      this.cartItemsid,
      this.cartOrders});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    countItems = json['countItems'];
    orderId = json['order_id'];
    orderUserid = json['order_userid'];
    orderCoupon = json['order_coupon'];
    orderAddress = json['order_address'];
    orderType = json['order_type'];
    orderPriceDelivery = json['order_price_delivery'];
    orderDatetime = json['order_datetime'];
    orderPrice = json['order_price'];
    orderTotalPrice = json['order_total_price'];
    orderPaymentMethod = json['order_payment_method'];
    orderStatus = json['order_status'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLang = json['address_lang'];
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
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemsid = json['cart_itemsid'];
    cartOrders = json['cart_orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countItems'] = this.countItems;
    data['order_id'] = this.orderId;
    data['order_userid'] = this.orderUserid;
    data['order_coupon'] = this.orderCoupon;
    data['order_address'] = this.orderAddress;
    data['order_type'] = this.orderType;
    data['order_price_delivery'] = this.orderPriceDelivery;
    data['order_datetime'] = this.orderDatetime;
    data['order_price'] = this.orderPrice;
    data['order_total_price'] = this.orderTotalPrice;
    data['order_payment_method'] = this.orderPaymentMethod;
    data['order_status'] = this.orderStatus;
    data['address_id'] = this.addressId;
    data['address_userid'] = this.addressUserid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_lang'] = this.addressLang;
    data['iteams_id'] = this.iteamsId;
    data['iteams_name'] = this.iteamsName;
    data['iteams_name_ar'] = this.iteamsNameAr;
    data['iteams_dec'] = this.iteamsDec;
    data['iteams_dec_ar'] = this.iteamsDecAr;
    data['iteams_image'] = this.iteamsImage;
    data['iteams_count'] = this.iteamsCount;
    data['iteams_active'] = this.iteamsActive;
    data['iteams_price'] = this.iteamsPrice;
    data['iteams_discount'] = this.iteamsDiscount;
    data['iteams_date'] = this.iteamsDate;
    data['iteams_cat'] = this.iteamsCat;
    data['cart_id'] = this.cartId;
    data['cart_userid'] = this.cartUserid;
    data['cart_itemsid'] = this.cartItemsid;
    data['cart_orders'] = this.cartOrders;
    return data;
  }
}
