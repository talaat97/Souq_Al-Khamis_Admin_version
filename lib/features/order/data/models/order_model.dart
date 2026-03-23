class OrderModel {
  final int? orderId;
  final String? orderUserDeviceToken;
  final int? orderUserId;
  final String? orderCoupon; // "0" = no coupon
  final String? orderAddress; // "0" = no address (pickup order)
  final String? orderType; // "0" = delivery, "1" = pickup
  final double? orderPriceDelivery;
  final String? orderDatetime;
  final double? orderPrice; // subtotal
  final double? orderTotalPrice; // final total inc. delivery
  final String? orderPaymentMethod; // "0" = cash, "1" = online
  final int? orderStatus; // 0=pending,1=approved,2=on_way,4=delivered
  final int? orderDelivery; // assigned driver ID (0 = not assigned)
  final double? orderRating;
  final String? orderRatingComment;

  // address relation — all nullable when order is pickup
  final int? addressId;
  final String? addressName;
  final String? addressCity;
  final String? addressStreet;
  final double? addressLat;
  final double? addressLng;

  OrderModel({
    this.orderId,
    this.orderUserDeviceToken,
    this.orderUserId,
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
    this.addressName,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLng,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: int.tryParse(json['order_id']?.toString() ?? ''),
      orderUserDeviceToken: json['order_user_device_token'],
      orderUserId: int.tryParse(json['order_userid']?.toString() ?? ''),
      orderCoupon: json['order_coupon']?.toString(),
      orderAddress: json['order_address']?.toString(),
      orderType: json['order_type']?.toString(),
      orderPriceDelivery:
          double.tryParse(json['order_pricedelviery']?.toString() ?? ''),
      orderDatetime: json['order_datetime'],
      orderPrice: double.tryParse(json['order_price']?.toString() ?? ''),
      orderTotalPrice:
          double.tryParse(json['order_totalprice']?.toString() ?? ''),
      orderPaymentMethod: json['order_paymentmethod']?.toString(),
      orderStatus: int.tryParse(json['order_status']?.toString() ?? ''),
      orderDelivery: int.tryParse(json['order_delivery']?.toString() ?? ''),
      orderRating: double.tryParse(json['order_rating']?.toString() ?? ''),
      orderRatingComment: json['order_rating_note']?.toString(),

      // address join data
      addressId: int.tryParse(json['address_id']?.toString() ?? ''),
      addressName: json['address_name']?.toString(),
      addressCity: json['address_city']?.toString(),
      addressStreet: json['address_street']?.toString(),
      addressLat: double.tryParse(json['address_lat']?.toString() ?? ''),
      // The parameter requested specifies addressing a typo where longitude is named `address_lang` in json
      addressLng: double.tryParse(json['address_lang']?.toString() ?? ''),
    );
  }
}
