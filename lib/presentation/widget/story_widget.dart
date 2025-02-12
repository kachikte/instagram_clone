import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/logic/logic.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryBloc, StoryState>(
      builder: (context, state) {
        if (state is StoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is StoryLoaded) {
          return SizedBox(
            height: 115,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.stories.length,
              itemBuilder: (context, index) {
                final story = state.stories[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: story.imageUrl,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              size: 70,
                              color: Colors.grey),
                        ),
                      ),
                      Text(story.username,
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return const Text('Failed to load stories');
        }
      },
    );
  }
}
