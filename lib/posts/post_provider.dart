import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primer_parcial/posts/post_builder.dart';
import 'package:primer_parcial/posts/post_cubit.dart';

class PostProvider extends StatelessWidget {
  const PostProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ejemplo Bloc",
      home: BlocProvider(create: (_) => PostCubit(), child: PostInterface()),
    );
  }
}
