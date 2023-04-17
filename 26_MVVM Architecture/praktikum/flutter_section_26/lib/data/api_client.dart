import 'package:flutter_section_26/models/contact_response.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static Future<ContactResponse> getData() async {
    const basePath =
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/db';
    var url = Uri.parse(basePath);
    var response = await http.get(url);
    return contactResponseFromJson(response.body);
  }
}
