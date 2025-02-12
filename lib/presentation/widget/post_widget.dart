import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:share_plus/share_plus.dart';

class PostWidget extends StatefulWidget {
  final String postText;
  final int userIndex;

  const PostWidget({super.key, required this.postText, required this.userIndex});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLiked = false;
  int likeCount = 0;
  bool isSaved = false;

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  void _sharePost() {
    Share.share('Check out this post: ${widget.postText}');
  }

  void _toggleSave() {
    setState(() {
      isSaved = !isSaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Header
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://source.unsplash.com/100x100/?person,${widget.userIndex}'),
            ),
            title: Text('User ${widget.userIndex}', style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('2 hours ago'),
            trailing: const Icon(Icons.more_vert),
          ),

          // Post Image
          CachedNetworkImage(
            imageUrl: 'https://source.unsplash.com/400x300/?nature,${widget.userIndex}',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error, size: 50),
          ),

          // Post Actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                // Like Button
                IconButton(
                  icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border, color: isLiked ? Colors.red : Colors.black),
                  onPressed: _toggleLike,
                ),
                Text('$likeCount'),

                // Comment Button
                IconButton(
                  icon: const Icon(Icons.comment_outlined),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Comment feature coming soon!')),
                    );
                  },
                ),

                // Share Button
                IconButton(
                  icon: const Icon(Icons.share_outlined),
                  onPressed: _sharePost,
                ),

                const Spacer(),

                // Save Button
                IconButton(
                  icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_border),
                  onPressed: _toggleSave,
                ),
              ],
            ),
          ),

          // Post Caption
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Text(
              widget.postText,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
