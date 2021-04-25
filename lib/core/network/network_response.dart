class NetworkResponse<T> {
  final T data;

  NetworkResponse({required this.data});

  factory NetworkResponse.fromJson(Map<String, dynamic> json) {
    return NetworkResponse(data: json['data']);
  }
}