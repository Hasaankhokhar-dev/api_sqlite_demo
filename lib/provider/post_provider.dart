import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_apis/models/posts.dart';
import 'package:http/http.dart' as http;

class PostProvider extends ChangeNotifier {
  List<Post> _post = [];
  List<Post> get posts => _post;
  // status
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  // error
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Api call
  Future<void> fetchPosts() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        _post = data.map((e) => Post.fromJson(e)).toList();
      } else {
        _errorMessage = 'Server Error: ${response.statusCode}';
      }
    } catch (e) {
      _errorMessage = 'Check you Internet Connection';
    }
    _isLoading = false;
    notifyListeners();
  }
}
