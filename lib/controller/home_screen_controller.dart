import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  Map? convertedJosn;

  Future<void> fetchFacts() async {
    final url = Uri.parse("https://catfact.ninja/fact"); // setup url

    try {
      final factRes = await http.get(url); // invoke api get method

      if (factRes.statusCode >= 200 && factRes.statusCode < 300) {
        // check status code
        log("success");
        log(factRes.body.toString()); // loggin response json data in the body
        convertedJosn = jsonDecode(factRes.body); // deccode json to dart
        notifyListeners();
      } else {
        log("status code is " + factRes.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

Map mymap = {
  "fact":
      "Not every cat gets \\high\\\" from catnip. Whether or not a cat responds to it depends upon a recessive gene: no gene\"",
  "length": 115,
};
