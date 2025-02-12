
import 'package:instagram_clone/data/data.dart';

class PostRepository {
  Future<List<Post>> fetchPosts() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    return [
      Post(
        username: "John",
        userAvatar: "https://picsum.photos/50",
        imageUrl: "https://picsum.photos/400",
        caption: "This is an amazing day!",
        likes: 120,
      ),
      Post(
        username: "Jane",
        userAvatar: "https://picsum.photos/51",
        imageUrl: "https://picsum.photos/401",
        caption: "Loving the vibe!",
        likes: 200,
      ),
    ];
  }
}
