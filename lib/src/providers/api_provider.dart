import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';

class ApiProvider {
  Client _client = Client();
  String apiBaseUrl = "";
  String suffixUrl = "";
  GlobalConfiguration _configuration = GlobalConfiguration();
  String mockupDataPath = "";

  ApiProvider() {
    apiBaseUrl = _configuration.getString('base_url');
  }

  String _makeRequest(String command, Map params) {
    //TODO: need rewrite this code
    if (params != null) {
      String data = "";
      params.forEach((key, value) => data += "$key=$value&");
      return "$apiBaseUrl$suffixUrl/$command?$data";
    } else
      return "$apiBaseUrl$suffixUrl/$command";
  }

  Future<dynamic> getData(String command, Map params,
      {String root = ''}) async {
    var jsonData;

    // Get json data
    if (apiBaseUrl != "") {
      var request = _makeRequest(command, params);
      final response = await _client.get(request);

      if (response?.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        //Try to use isolate here
        //jsonData = json.decode(response.body);
        jsonData = compute(jsonDecode, response.body);
      }
    }

    // TODO: use mock data for debugging
    if (jsonData == null && mockupDataPath != "") {
      final mockData = await Future.delayed(new Duration(seconds: 1),
              () => rootBundle.loadString(mockupDataPath));

      //Try to use isolate here
      jsonData = compute(decodeMockupData, {"data": mockData, "root": root});
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
        url = "$apiBaseUrl/$command";
      }

      final response = await _client.post(
        url,
        body: json.encode(params),
        encoding: Encoding.getByName('utf-8'),
        headers: {
          'Content-Type': 'application/json',
//          'Authorization': 'Bearer $accessToken'
        },
      );

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        jsonData = json.decode(response.body);
      }
    }

    // FIXME: user mockup data
    if (jsonData == null && mockupDataPath != "") {
      //response local
      final mockData = await Future.delayed(new Duration(seconds: 0),
              () => rootBundle.loadString(mockupDataPath));
      return json.decode(mockData)["updated"];
    }
    return jsonData;
  }

  }
