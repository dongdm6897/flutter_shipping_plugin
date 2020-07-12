import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client _client = Client();
  String apiBaseUrl = "";
  String apiUrlSuffix = "";
  String apiVersion = "";

  ApiProvider() {
    apiBaseUrl = GlobalConfiguration().getString("base_url");
    apiVersion = GlobalConfiguration().getString("api_version");
  }

  String _makeRequest(String command, Map params) {
    if (params != null) {
      String data = "";
      params.forEach((key, value) => data += "$key=$value&");
      return "$apiBaseUrl/$apiVersion$apiUrlSuffix/$command?$data";
    } else
      return "$apiBaseUrl/$apiVersion$apiUrlSuffix/$command";
  }

  Future<dynamic> getData(String command, Map params,
      {Map<String, String> headers}) async {
    var jsonData;

    // Get json data
    if (apiBaseUrl != "") {
      if (headers == null) headers = {};
      var request = _makeRequest(command, params);
      final response = await _client.get(request,
          headers: headers..addAll({'Content-Type': 'application/json'}));

      if (response?.statusCode == 200) {
        if (response.headers['content-type'].contains('json'))
          jsonData = compute(jsonDecode, response.body);
      }
    }

    return jsonData;
  }

  Future<dynamic> postData(String command, Map params,
      {Map<String, String> headers}) async {
    var jsonData;

    if (apiBaseUrl != "") {
      String url;
      url = "$apiBaseUrl";
      if (headers == null) headers = {};
      if (command != null && command.isNotEmpty) {
        url = "$apiBaseUrl/$apiVersion$apiUrlSuffix/$command";
      }
      final response = await _client.post(
        url,
        body: json.encode(params),
        encoding: Encoding.getByName('utf-8'),
        headers: headers..addAll({'Content-Type': 'application/json'}),
      );
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        jsonData = json.decode(response.body);
      }
    }
    return jsonData;
  }
}
