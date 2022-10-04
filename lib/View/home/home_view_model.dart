import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_api/View/home/home_model.dart';
part 'home_view_model.g.dart';

// ignore: library_private_types_in_public_api
class PostData = _PostDataBase with _$PostData;

abstract class _PostDataBase with Store {
  String urlData = "https://jsonplaceholder.typicode.com/posts";
  @observable
  bool isLoading = false;

  @observable
  List<PostModel> posts = [];

  @action
  Future<void> getAllPost() async {
    final response = await Dio().get(urlData);
    if (response.statusCode == 200) {
      final responseData = response.data as List;
      posts = responseData.map((e) => PostModel.fromJson(e)).toList();
      //print(posts[1].body);
    }
    isLoading = true;
  }
}
