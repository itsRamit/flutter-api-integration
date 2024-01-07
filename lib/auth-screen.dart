import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_ntegration/model.dart';
import 'package:http/http.dart' as http;

class auth_screen extends StatefulWidget {
  const auth_screen({super.key});

  @override
  State<auth_screen> createState() => _auth_screenState();
}

class _auth_screenState extends State<auth_screen> {
  List<Todo> todos = [];
  

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
              child: todos.length != 0
                  ? ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(todos[index].title),
                          subtitle:
                              Text('Completed: ${todos[index].completed}'),
                        );
                      },
                    )
                  : Text("No Data"),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {

              },
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
