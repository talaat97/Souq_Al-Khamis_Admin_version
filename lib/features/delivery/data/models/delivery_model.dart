class DeliveryModel {
  String? deliveriesId;
  String? deliveryName;
  String? deliveryEmail;
  String? deliveryPhone;
  String? deliveryImage;
  String? deliveryApprove;
  String? deliveryCreate;

  DeliveryModel(
      {this.deliveriesId,
      this.deliveryName,
      this.deliveryEmail,
      this.deliveryPhone,
      this.deliveryImage,
      this.deliveryApprove,
      this.deliveryCreate});

  DeliveryModel.fromJson(Map<String, dynamic> json) {
    deliveriesId = json['delivery_id'];
    deliveryName = json['delivery_name'];
    deliveryEmail = json['delivery_email'];
    deliveryPhone = json['delivery_phone'];
    deliveryImage = json['delivery_image'];
    deliveryApprove = json['delivery_approve'];
    deliveryCreate = json['delivery_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['delivery_id'] = deliveriesId;
    data['delivery_name'] = deliveryName;
    data['delivery_email'] = deliveryEmail;
    data['delivery_phone'] = deliveryPhone;
    data['delivery_image'] = deliveryImage;
    data['delivery_approve'] = deliveryApprove;
    data['delivery_create'] = deliveryCreate;
    return data;
  }
}
