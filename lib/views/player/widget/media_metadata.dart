import 'package:flutter/material.dart';

class MediaMetadata extends StatelessWidget {
  const MediaMetadata({super.key, required this.imageUrl, required this.title, required this.artist});

  final String imageUrl;
  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: 300,
              height: 300,
            ),
          ),
        ),
        const SizedBox(height: 20,),
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 20),),
        const SizedBox(height: 20,),
        Text(artist, style: const TextStyle(color: Colors.white, fontSize: 20),),
      ],
    );
  }
}