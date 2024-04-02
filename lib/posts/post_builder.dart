import 'dart:js';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primer_parcial/posts/post_cubit.dart';
import 'package:primer_parcial/posts/post_state.dart';

class PostInterface extends StatefulWidget {
  const PostInterface({super.key});

  @override
  State<PostInterface> createState() => _PostInterfaceState();
}

class Welcome {
  int userId;
  int id;
  String title;
  String body;

  Welcome({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

Widget loadData(List<PostsModels> listPost) {
  return GridView.count(
    crossAxisSpacing: 1,
    mainAxisSpacing: 2,
    crossAxisCount: 2,
    children: listPost.map((post) {
      return Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(post.body),
          ],
        ),
      );
    }).toList(),
  );
}

class _PostInterfaceState extends State<PostInterface> {
  @override
  Widget build(BuildContext context) {
    void _navigate(BuildContext context, Widget page) {
      Future.delayed(Duration(milliseconds: 800), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(title: const Text("User Authentification")),
      body: Container(
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostWaiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostLoaded) {
              return loadData(state.listPost);
            } else {
              return const Text("fallido");
            }
          },
        ),
      ),
    );
  }
}
