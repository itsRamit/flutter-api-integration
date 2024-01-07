import 'package:flutter/material.dart';

class auth_screen extends StatefulWidget {
  const auth_screen({super.key});

  @override
  State<auth_screen> createState() => _auth_screenState();
}

class _auth_screenState extends State<auth_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 375,
              height: 600,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Set your desired border color here
                  width: 2.0, // Set the width of the border
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 100,
                width: 100,
                color: Colors.green,
                child: Center(
                  child: Text("Fetch todos"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
