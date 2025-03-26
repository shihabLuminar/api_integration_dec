import 'package:api_integration/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenProvider = context.read<HomeScreenController>();
    final screnState = context.watch<HomeScreenController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Please enter a number"),
            ));
          } else {
            screenProvider.fetchFacts(controller.text);
          }
        },
      ),
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: screnState.isLoading
            ? CircularProgressIndicator()
            : Column(
                children: [
                  TextField(
                    controller: controller,
                  ),
                  Text(screnState.convertedJosn?["quote"] ?? "no data"),
                  Text(screnState.convertedJosn?["author"] ?? "no dat"),
                ],
              ),
      ),
    );
  }
}
