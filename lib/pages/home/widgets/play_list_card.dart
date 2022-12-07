import 'package:flutter/material.dart';
import 'package:provider_demo/utils/custom_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayListCard extends StatelessWidget {
  const PlayListCard(
      {Key key, @required this.curatedPodcasts, this.index, this.onpress})
      : super(key: key);

  final List<dynamic> curatedPodcasts;
  final int index;
  final Function onpress;

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Row(
        children: [
          Icon(
            Icons.play_arrow_outlined,
            size: 35,
            color: customBlueColor,
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300,
                child: Text(
                  curatedPodcasts[index].title,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                curatedPodcasts[index].sourceDomain,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Spacer(),
          Text(
            'T ${curatedPodcasts[index].total.toString()}',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
