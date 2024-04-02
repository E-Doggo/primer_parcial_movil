import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primer_parcial/posts/post_state.dart';
import 'package:dio/dio.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostWaiting()) {
    fetchData();
  }

  void _addStarredPoints() {}

  void _filterPosts() {}

  void fetchData() async {
    final dio = Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      List<PostsModels> postsModelsFromJson(List<dynamic> lst) {
        return List<PostsModels>.from(lst.map((x) => PostsModels.fromJson(x)))
            .toList();
      }

      List<PostsModels> finalData = postsModelsFromJson(response.data);
      emit(PostLoaded(finalData));
    } else {
      emit(PostFailed());
    }
  }
}
