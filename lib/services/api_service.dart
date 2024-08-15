import "dart:convert";
import "dart:developer";
import "package:http/http.dart";


class ApiServices {

  factory ApiServices() {
    return _singleton;
  }

  ApiServices._internal();
  static final ApiServices _singleton = ApiServices._internal();


  Future postMethod(String endPoint, body, Function(dynamic) successJson, Function(dynamic) failurejson) async {
    final baseUrl = "https://shareittofriends.com/demo/flutter/$endPoint";
    log("Request Body: $body", name: "ApiServices");

    Map<String, String> headers = {
      "Access-Control-Allow-Headers": "Content-Type, Authorization"
    };
    Response response = await post(Uri.parse(baseUrl), body: body, headers: headers);

    print("Response:: ${response.body}");

    if (response.statusCode == 200) {
      successJson(jsonDecode(response.body));
    } else {
      failurejson(jsonDecode(response.body));
    }
  }

}
