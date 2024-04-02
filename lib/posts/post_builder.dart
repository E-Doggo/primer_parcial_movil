import 'package:flutter/material.dart';

class PostInterface extends StatefulWidget {
  const PostInterface({super.key});

  @override
  State<PostInterface> createState() => _PostInterfaceState();
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

    return Container();
  }
}
