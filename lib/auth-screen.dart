import 'package:flutter/material.dart';
import 'package:flutter_api_ntegration/model.dart';
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
    var todos = ref.watch(todosList);
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
            todos.length != 0
                ? Container(
                    width: 375,
                    height: 600,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(todos[index].title),
                          subtitle:
                              Text('Completed: ${todos[index].completed}'),
                        );
                      },
                    ),
                  )
                : const Center(
                    child: Text("Click the text box to fetch data",
                        style: TextStyle(color: Colors.red)),
                  ),
            const SizedBox(
              height: 20,
            ),
            // We are using gesture detector here to provide onTap functionality on the
            // container, as there is no default onTap functionality in it.
            GestureDetector(
              onTap: () async {
                List<Todo> temp = await Fetchtodos();
                ref.read(todosList.notifier).update((state) => temp);
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text("Fetch Todos"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
