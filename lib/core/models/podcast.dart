import 'package:provider_demo/core/models/best_podcast.dart';

class Podcast {
  Podcast({
    this.id,
    this.title,
    this.publisher,
    this.image,
    this.thumbnail,
    this.listennotesUrl,
    this.listenScore,
    this.listenScoreGlobalRank,
    this.totalEpisodes,
    this.explicitContent,
    this.description,
    this.itunesId,
    this.rss,
    this.latestPubDateMs,
    this.earliestPubDateMs,
    this.language,
    this.country,
    this.website,
    this.isClaimed,
    this.email,
    this.type,
    this.genreIds,
  });

  String id;
  String title;
  String publisher;
  String image;
  String thumbnail;
  String listennotesUrl;
  String listenScore;
  String listenScoreGlobalRank;
  int totalEpisodes;
  bool explicitContent;
  String description;
  int itunesId;
  String rss;
  int latestPubDateMs;
  int earliestPubDateMs;
  String language;
  String country;
  String website;
  bool isClaimed;
  String email;
  String type;
  List<int> genreIds;

  factory Podcast.fromJson(Map<String, dynamic> json) => Podcast(
        id: json["id"],
        title: json["title"],
        publisher: json["publisher"],
        image: json["image"],
        thumbnail: json["thumbnail"],
        listennotesUrl: json["listennotes_url"],
        listenScore: json["listen_score"],
        listenScoreGlobalRank: json["listen_score_global_rank"],
        totalEpisodes: json["total_episodes"],
        explicitContent: json["explicit_content"],
        description: json["description"],
        itunesId: json["itunes_id"],
        rss: json["rss"],
        latestPubDateMs: json["latest_pub_date_ms"],
        earliestPubDateMs: json["earliest_pub_date_ms"],
        language: json["language"],
        country: json["country"],
        website: json["website"] == null ? null : json["website"],
        isClaimed: json["is_claimed"],
        email: json["email"],
        type: json["type"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "publisher": publisher,
        "image": image,
        "thumbnail": thumbnail,
        "listennotes_url": listennotesUrl,
        "listen_score": listenScore,
        "listen_score_global_rank": listenScoreGlobalRank,
        "total_episodes": totalEpisodes,
        "explicit_content": explicitContent,
        "description": description,
        "itunes_id": itunesId,
        "rss": rss,
        "latest_pub_date_ms": latestPubDateMs,
        "earliest_pub_date_ms": earliestPubDateMs,
        "language": language,
        "country": country,
        "website": website == null ? null : website,
        "is_claimed": isClaimed,
        "email": email,
        "type": type,
       "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
      };
}
