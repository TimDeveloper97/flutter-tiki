// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:http/http.dart' as http;

const baseUrl = 'https://jsonplaceholder.typicode.com/posts/';

class HomeProvider {
  final http.Client httpClient;
  HomeProvider({required this.httpClient});

  getAll() async {
    try {
      var response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        // Iterable jsonResponse = json.decode(response.body);
        // List<MyModel> listMyModel =
        // jsonResponse.map((model) => MyModel.fromJson(model)).toList();
        // listMyModel.removeRange(2, listMyModel.length);
        // List<MyModel> listMyModel = new List<MyModel>.empty();
        // return listMyModel;
      } else
        print('error');
    } catch (_) {}
  }

  getId(id) async {
    try {
      var response = await httpClient.get('baseUrlid');
      if (response.statusCode == 200) {
        //Map<String, dynamic> jsonResponse = json.decode(response.body);
      } else
        print('erro -get');
    } catch (_) {}
  }
}
