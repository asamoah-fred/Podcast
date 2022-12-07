import 'package:flutter/material.dart';
import 'package:provider_demo/core/models/curated_podcasts.dart';
import 'package:provider_demo/pages/home/widgets/play_list_card.dart';
import 'package:provider_demo/utils/custom_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayList extends StatelessWidget {
  final CuratedList playlist;
  const PlayList({Key key, this.playlist}) : super(key: key);

  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Playlist'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          itemCount: playlist.podcasts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _launchInWebViewWithJavaScript(
                  playlist.podcasts[index].listennotesUrl),
              child: Row(
                children: [
                  Icon(
                    Icons.play_arrow_outlined,
                    size: 35,
                    color: customBlueColor,
                  ),
                  // Spacer(),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        child: Text(
                          playlist.podcasts[index].title,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: 250,
                        child: Text(
                          playlist.podcasts[index].publisher,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.more_vert),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
