import 'package:dio/dio.dart';

import '../models/contact.dart';

class ApiClient {
  final _basePath =
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts';

  final Dio _dio = Dio();

  Future<Contact> getContacts({int id = 3}) async {
    var respone = await _dio.get('$_basePath/$id');
    var cp = Contact.fromJson(respone.data);
    return respone.statusCode == 200 ? cp : Contact();
  }

  Future<Contact> postContact() async {
    var respone = await _dio.post(_basePath);
    return Contact.fromJson(respone.data);
  }

  Future<Contact> putContact({int id = 3}) async {
    var respone = await _dio.put('$_basePath/$id');
    return Contact.fromJson(respone.data);
  }
}
