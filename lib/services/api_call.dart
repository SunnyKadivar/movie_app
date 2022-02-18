import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/models.dart';

getAPI(url,Function(ResponseAPI) callback) {
  // var url = "https://jsonplaceholder.typicode.com/users";

  var uri = Uri.parse(url);
  http.get(uri, headers: null).then((value) {
    debugPrint("==request== $uri");
    _handleResponse(value, callback);
  }).onError((error, stackTrace) {
    debugPrint("onError== $error");
    _handleError(error, callback);
  }).catchError((error) {
    debugPrint("catchError== $error");
    _handleError(error, callback);
  });
}

_handleResponse(value, Function(ResponseAPI) callback) {
  // debugPrint("==response== ${value.body}");
  callback.call(ResponseAPI(value.statusCode, value.body));
}

_handleError(value, Function(ResponseAPI) callback) {
  if (!value.toString().contains("errno = 111")) {
    callback.call(ResponseAPI(
      0,
      "No internet connection",
      isError: true,
    ));
  } else {
    callback.call(ResponseAPI(
      0,
      "Something went wrong",
      isError: true,
    ));
  }
}