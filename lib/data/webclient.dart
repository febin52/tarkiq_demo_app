// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WebClient {
  static Future<dynamic> post(url, data) async {
    Map sendData = {};
    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }
    var response;
    var body = json.encode(sendData);
    try {
      response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      debugPrint(response.body.toString());
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };
      return error;
    }
  }

  static Future<dynamic> get(url) async {
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        var error = {
          "status": false,
          "msg": "Invalid Request",
        };
        return error;
      }
    } on Exception catch (_) {
      // //print("Exception -- " + e.toString());
    }
  }
}
