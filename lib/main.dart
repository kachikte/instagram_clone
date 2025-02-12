import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'logic/logic.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PostBloc()..add(LoadPostsEvent())),
        BlocProvider(create: (_) => StoryBloc()..add(LoadStoriesEvent())),
      ],
      child: const MyApp(),
    ),
  );
}
