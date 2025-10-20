import 'package:flutter/material.dart';

class FullImageView extends StatelessWidget {
  final String image;
  final String tag;

  const FullImageView({super.key, required this.image, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Hero(
            tag: tag,
            child: InteractiveViewer(
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
