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

  ApiProvider(){
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
      {String root = ''}) async {
    var jsonData;

    // Get json data
    if (apiBaseUrl != "") {
      var request = _makeRequest(command, params);
      final response = await _client.get(request, headers: {
        'Authorization':
        'Bearer ${params != null ? params['access_token'] : ''}'
      });

      if (response?.statusCode == 200) {
        if (response.headers['content-type'].contains('json'))
          jsonData = compute(jsonDecode, response.body);
      }
    }


    return jsonData;
  }

  // Try to use isolate to decode mockup data
  static dynamic decodeMockupData(dynamic params) {
    final mockData = params["data"];
    final root = params["root"];
    var jsonData = jsonDecode(mockData);
    if (root != '') {
      jsonData = jsonData[root];
    }
    return jsonData;
  }


  Future<dynamic> postData(String command, Map params) async {
    var jsonData;

    if (apiBaseUrl != "") {
      String url;
      url = "$apiBaseUrl";
      if (command != null && command.isNotEmpty) {
        url = "$apiBaseUrl/$apiVersion$apiUrlSuffix/$command";
      }
      String accessToken = params != null ? params['access_token'] : '';
      params.remove('access_token');
      final response = await _client.post(
        url,
        body: json.encode(params),
        encoding: Encoding.getByName('utf-8'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        },
      );
      print("fuck you xxx ${json.decode(response.body)}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        jsonData = json.decode(response.body);
      }
    }
    return jsonData;
  }

}
