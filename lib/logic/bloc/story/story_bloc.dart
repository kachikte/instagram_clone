import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/logic/logic.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final StoryRepository storyRepository = StoryRepository();

  StoryBloc() : super(StoryLoading()) {
    on<LoadStoriesEvent>((event, emit) async {
      try {
        final stories = await storyRepository.fetchStories();
        emit(StoryLoaded(stories));
      } catch (e) {
        emit(StoryError("Failed to load stories"));
      }
    });
  }
}
