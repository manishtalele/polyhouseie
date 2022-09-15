import 'dart:convert';

import 'package:http/http.dart';

Future fetchHomePage({required String name}) async {
  List data = [];
  Response response;
  try {
    response = await get(Uri.parse(
        "https://run.mocky.io/v3/88c9abd4-e893-428a-b947-5c9364c94a67"));
    data.add(jsonDecode(response.body)["ContinueWatching"]);
    return data;
  } catch (e) {
    return e;
  }
}
