import 'package:api_integration/controller/home_screen_controller.dart';
import 'package:api_integration/controller/product_api_screen_controller.dart';
import 'package:api_integration/views/home_screen/home_screen.dart';
import 'package:api_integration/views/product_api_screen/product_api_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController()),
        ChangeNotifierProvider(
            create: (context) => ProductApiScreenController()),
      ],
      child: MaterialApp(
        home: ProductApiScreen(),
      ),
    );
  }
}
