class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final int? count;

  ApiResponse({
    required this.success,
    this.data,
    this.message,
    this.count,
  });

  factory ApiResponse.fromJson(
    Map<dynamic, dynamic> json,
    T Function(dynamic json) fromJson,
  ) {
    return ApiResponse(
      success: json['status'] == 'success',
      message: json['message'],
      count: json['count'],
      data: json['data'] != null ? fromJson(json['data']) : null,
    );
  }
}
