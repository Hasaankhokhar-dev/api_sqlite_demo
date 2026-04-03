import 'package:flutter/material.dart';
import 'package:flutter_apis/provider/post_provider.dart';
import 'package:provider/provider.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      // ... inside HomePage build method ...
      body: Consumer<PostProvider>(
        builder: (context, value, child) {
          // 1. Agar loading ho rahi hai
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );

          }

          // 2. Agar koi error aaya hai
          if (value.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(value.errorMessage),
                  ElevatedButton(
                    onPressed: () => value.fetchPosts(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // 3. Agar data empty hai (success but no posts)
          if (value.posts.isEmpty) {
            return const Center(
              child: Text('No posts found'),
            );
          }

          // 4. Data display
          return ListView.builder(
            itemCount: value.posts.length,
            itemBuilder: (context, index) {
              final post = value.posts[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(
                    post.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(post.body),
                ),
              );
            },
          );
        },
      ),
     // body: Consumer<PostProvider>(
      //builder: (context, value, child) {
          // if(value.posts.isEmpty){
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }
          // return ListView.builder(
          //   itemCount: value.posts.length,
          //   itemBuilder: (context, index) {
          //     return Card(
          //       margin: EdgeInsets.all(8),
          //       child: ListTile(
          //         title: Text(
          //           value.posts[index].title,
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //         subtitle: Text(
          //           value.posts[index].body,
          //         ),
          //       ),
          //     );
          // },
          // );
      //  },
    //  ),
    );
  }
}
