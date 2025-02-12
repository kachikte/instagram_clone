import 'package:instagram_clone/data/data.dart';

abstract class StoryState {}

class StoryLoading extends StoryState {}

class StoryLoaded extends StoryState {
  final List<Story> stories;
  StoryLoaded(this.stories);
}

class StoryError extends StoryState {
  final String message;
  StoryError(this.message);
}
