import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/data/data.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository = PostRepository();

  PostBloc() : super(PostLoading()) {
    on<LoadPostsEvent>((event, emit) async {
      try {
        final posts = await postRepository.fetchPosts();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError("Failed to load posts"));
      }
    });
  }
}
