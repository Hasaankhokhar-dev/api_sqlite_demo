import 'package:flutter/material.dart';
import 'package:flutter_apis/provider/post_provider.dart';
import 'package:flutter_apis/views/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider()..fetchPosts(),
      child: MaterialApp(home: HomePage()),
    );
  }
}
