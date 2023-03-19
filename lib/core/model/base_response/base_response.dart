class RequestResponse {
  bool success = false;
  String? error;
  late Map<String, dynamic> data = {};

  RequestResponse(this.success, {this.error});

  RequestResponse.fromJson(json, {bool success = false, String? error}) {
    data = json;
    success = success;
    error = error;
  }

  // toJson() {
  //   return {
  //     'success': success,
  //     'error': error,
  //     'body': data,
  //   };
  // }
}
