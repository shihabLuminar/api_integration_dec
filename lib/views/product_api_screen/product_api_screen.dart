import 'package:api_integration/controller/product_api_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductApiScreen extends StatelessWidget {
  const ProductApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenState = context.watch<ProductApiScreenController>();
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(-6, -6),
                    blurRadius: 8,
                    color: Colors.black12),
                BoxShadow(
                    offset: Offset(6, -6),
                    blurRadius: 8,
                    color: Colors.black12),
                BoxShadow(
                    offset: Offset(-6, 6),
                    blurRadius: 8,
                    color: Colors.black12),
                BoxShadow(
                    offset: Offset(6, 6), blurRadius: 8, color: Colors.black12),
              ]),
          width: 300,
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                    fit: BoxFit.contain,
                    height: 300,
                    width: 300,
                    screenState.product?.image ?? ""),
              ),
              Text(
                screenState.product?.title ?? "",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                screenState.product?.description ?? "",
                maxLines: 3,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "\$ ${screenState.product?.price ?? ""}",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),

              //rating

              Text(
                " ⭐",
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),

              InkWell(
                onTap: () {
                  context.read<ProductApiScreenController>().fetchProduct("4");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10)),
                    color: Colors.pinkAccent,
                  ),
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
