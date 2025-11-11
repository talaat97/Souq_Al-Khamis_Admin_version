class OrderModel {
  String? orderId;
  String? orderUserDevicetoken;
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
  String? orderDelivery;
  String? orderRating;
  String? orderRatingComment;
  String? addressId;
  String? addressUserid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLang;

  OrderModel(
      {this.orderId,
      this.orderUserDevicetoken,
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
      this.orderDelivery,
      this.orderRating,
      this.orderRatingComment,
      this.addressId,
      this.addressUserid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLang});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserDevicetoken = json['order_user_devicetoken'];
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
    orderDelivery = json['order_delivery'];
    orderRating = json['order_rating'];
    orderRatingComment = json['order_rating_comment'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLang = json['address_lang'];
  }
}
