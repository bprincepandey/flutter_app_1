import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String dev = "Bhupendra";
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to my first flutter app. By: $dev")
        )
      ),
      drawer: MyDrawer(),
    );
  }
}
