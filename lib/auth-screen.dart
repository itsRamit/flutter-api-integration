import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api_ntegration/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class auth_screen extends ConsumerStatefulWidget {
  const auth_screen({super.key});

  @override
  ConsumerState<auth_screen> createState() => _auth_screenState();
}

class _auth_screenState extends ConsumerState<auth_screen> {
  @override
  Widget build(BuildContext context) {
    var todos = ref.watch(fetchtodos);
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
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: todos.when(
                    data: (data) => ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(data[index].title),
                              subtitle:
                                  Text('Completed: ${data[index].completed}'),
                            );
                          },
                        ),
                    error: (e, StackTrace) => const Center(child: Text("No Data")),
                    loading: () => const Center(child: CircularProgressIndicator()))),
            const SizedBox(
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
