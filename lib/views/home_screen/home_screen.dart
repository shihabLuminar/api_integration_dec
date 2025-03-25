import 'package:api_integration/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenProvider = context.read<HomeScreenController>();
    final screnState = context.watch<HomeScreenController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          screenProvider.fetchFacts();
        },
      ),
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Text(screnState.convertedJosn?["fact"] ?? "fetch new fact"),
      ),
    );
  }
}
