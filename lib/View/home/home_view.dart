import 'package:flutter/material.dart';
import 'package:mobx_api/View/home/home_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatelessWidget {
  final _post = PostData();
  @override
  Widget build(BuildContext context) {
    _post.getAllPost();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Flutter Api Example With Mobx",
              style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          child: Observer(builder: (_) {
            return _post.isLoading
                ? ListView.builder(
                    itemCount: _post.posts.length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        title: Text(_post.posts[index].title.toString()),
                        subtitle: Text(_post.posts[index].body.toString()),
                        leading: Text(_post.posts[index].id.toString()),
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.amber,
                    ),
                  );
          }),
        ));
  }
}
