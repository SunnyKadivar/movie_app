class ResponseAPI {
  int code;
  String response;
  // ignore: prefer_typing_uninitialized_variables
  var isError;
  // ignore: prefer_typing_uninitialized_variables
  var isCacheError;
  // ignore: prefer_typing_uninitialized_variables
  var error;

  ResponseAPI(this.code, this.response,
      {this.isError, this.isCacheError, this.error});
}
