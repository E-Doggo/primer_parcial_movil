import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primer_parcial/posts/post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostWaiting());

  void _addStarredPoints() {}

  void _filterPosts() {}
}
