import 'dart:convert';

import 'package:api_integration/model/product_api_screen_models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductApiScreenController with ChangeNotifier {
  bool isLoading = false;
  ProductModel? product;

  Future<void> fetchProduct(String productId) async {
    final url = Uri.parse("https://fakestoreapi.com/products/$productId");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        product = productModelFromJson(res.body);
      } else {
        debugPrint("Error");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}
