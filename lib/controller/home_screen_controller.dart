import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  Map? convertedJosn;
  bool isLoading = false;

  Future<void> fetchFacts(String id) async {
    final url = Uri.parse("https://dummyjson.com/quotes/$id"); // setup url

    try {
      isLoading = true;
      notifyListeners();
      final factRes = await http.get(url); // invoke api get method

      if (factRes.statusCode >= 200 && factRes.statusCode < 300) {
        // check status code
        log("success");
        log(factRes.body.toString()); // loggin response json data in the body
        convertedJosn = jsonDecode(factRes.body); // deccode json to dart
      } else {
        log("status code is " + factRes.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }
}
