import 'dart:convert';
import 'package:flutter_api_ntegration/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

//I have used StateProvider as we wanted to change the state when the text box is tapped.
final todosList = StateProvider<List<Todo>>((ref) => []);

 Future<List<Todo>> Fetchtodos() async {
       final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => Todo.fromJson(e)).toList();
    } else {
      throw Exception('Error');
    }
     }