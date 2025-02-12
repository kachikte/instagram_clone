
import 'package:instagram_clone/data/data.dart';

class StoryRepository {
  Future<List<Story>> fetchStories() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    return [
      Story(username: "John", imageUrl: "https://picsum.photos/100"),
      Story(username: "Jane", imageUrl: "https://picsum.photos/101"),
      Story(username: "Alice", imageUrl: "https://picsum.photos/102"),
    ];
  }
}
