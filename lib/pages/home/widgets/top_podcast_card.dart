import 'package:flutter/material.dart';
import 'package:provider_demo/core/models/podcast.dart';

class TopPodcastCard extends StatelessWidget {
  const TopPodcastCard({
    Key key,
    @required this.topPodcasts,
    this.index,
    this.onpress,
  }) : super(key: key);

  final List<Podcast> topPodcasts;
  final int index;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              image: NetworkImage(topPodcasts[index].image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
