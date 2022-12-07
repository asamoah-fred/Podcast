import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/core/models/curated_podcasts.dart';
import 'package:provider_demo/core/models/podcast.dart';
import 'package:provider_demo/core/view_models/podcast_provider.dart';
import 'package:provider_demo/pages/home/widgets/play_list_card.dart';
import 'package:provider_demo/pages/home/widgets/section_head.dart';
import 'package:provider_demo/pages/home/widgets/top_podcast_card.dart';
import 'package:provider_demo/pages/playlist.dart/playlist.dart';
import 'package:provider_demo/utils/custom_colors.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  List<Podcast> topPodcasts = [];
  List<CuratedList> curatedPodcasts = [];
  PodCastProvider bestPodCast;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBestPodcasts(context);
    getCuratedPodcasts(context);
  }

  @override
  Widget build(BuildContext context) {
    bestPodCast = Provider.of<PodCastProvider>(context, listen: false);
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: RefreshIndicator(
                onRefresh: () => getBestPodcasts(context),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Listen to Your \nFavorite Podcasts',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold, letterSpacing: 2),
                      ),
                    ),
                    Text(
                      'Dicover more than 100k talk shows',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      cursorColor:
                          Theme.of(context).textSelectionTheme.cursorColor,
                      decoration: buildInputDecoration(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SectionHead(
                      leftText: 'Top Podcasts',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          width: 20,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            topPodcasts.length < 10 ? topPodcasts.length : 10,
                        itemBuilder: (context, index) {
                          return TopPodcastCard(
                            topPodcasts: topPodcasts,
                            index: index,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SectionHead(
                      leftText: 'Playlist',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: curatedPodcasts.length < 10
                          ? curatedPodcasts.length
                          : 10,
                      itemBuilder: (context, index) {
                        return PlayListCard(
                            curatedPodcasts: curatedPodcasts,
                            index: index,
                            onpress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlayList(playlist: curatedPodcasts[index],),
                                ),
                              );
                            });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      hintText: 'Search for podcasts',
      hintStyle: TextStyle(color: Color(0XFFBEBEBE)),
      filled: true,
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      suffixIcon: Container(
        width: 10,
        decoration: BoxDecoration(
          color: customBlueColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> getBestPodcasts(context) async {
    setState(() {
      isLoading = true;
    });
    final _result = await Provider.of<PodCastProvider>(context, listen: false)
        .getBestPodcasts();
    if (bestPodCast.errorMessage != null) {
      print(bestPodCast.errorMessage);
      setState(() {
        isLoading = false;
      });
      return;
    }
    topPodcasts = _result;
    setState(() {
      isLoading = false;
    });
  }

  Future<void> getCuratedPodcasts(context) async {
    setState(() {
      isLoading = true;
    });
    final _result = await Provider.of<PodCastProvider>(context, listen: false)
        .getCuratedPodcasts();
    if (bestPodCast.errorMessage != null) {
      print(bestPodCast.errorMessage);
      setState(() {
        isLoading = false;
      });
      return;
    }
    curatedPodcasts = _result;
    setState(() {
      isLoading = false;
    });
  }
}
