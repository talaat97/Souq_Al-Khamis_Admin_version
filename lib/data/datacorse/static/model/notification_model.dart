class NotificationModel {
  String? notificationId;
  String? notificationTitle;
  String? notificationBody;
  String? notificationUserid;
  String? notificationOrderId;
  String? notificationDateTime;

  NotificationModel(
      {this.notificationId,
      this.notificationTitle,
      this.notificationBody,
      this.notificationUserid,
      this.notificationOrderId,
      this.notificationDateTime});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationUserid = json['notification_userid'];
    notificationOrderId = json['notification_orderId'];
    notificationDateTime = json['notification_dateTime'];
  }
}
