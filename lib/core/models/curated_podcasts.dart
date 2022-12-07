// To parse this JSON data, do
//
//     final curatedPodcast = curatedPodcastFromJson(jsonString);

import 'dart:convert';

CuratedPodcast curatedPodcastFromJson(String str) => CuratedPodcast.fromJson(json.decode(str));

String curatedPodcastToJson(CuratedPodcast data) => json.encode(data.toJson());

class CuratedPodcast {
    CuratedPodcast({
        this.curatedLists,
        this.total,
        this.hasNext,
        this.hasPrevious,
        this.pageNumber,
        this.previousPageNumber,
        this.nextPageNumber,
    });

    List<CuratedList> curatedLists;
    int total;
    bool hasNext;
    bool hasPrevious;
    int pageNumber;
    int previousPageNumber;
    int nextPageNumber;

    factory CuratedPodcast.fromJson(Map<String, dynamic> json) => CuratedPodcast(
        curatedLists: List<CuratedList>.from(json["curated_lists"].map((x) => CuratedList.fromJson(x))),
        total: json["total"],
        hasNext: json["has_next"],
        hasPrevious: json["has_previous"],
        pageNumber: json["page_number"],
        previousPageNumber: json["previous_page_number"],
        nextPageNumber: json["next_page_number"],
    );

    Map<String, dynamic> toJson() => {
        "curated_lists": List<dynamic>.from(curatedLists.map((x) => x.toJson())),
        "total": total,
        "has_next": hasNext,
        "has_previous": hasPrevious,
        "page_number": pageNumber,
        "previous_page_number": previousPageNumber,
        "next_page_number": nextPageNumber,
    };
}

class CuratedList {
    CuratedList({
        this.id,
        this.title,
        this.description,
        this.sourceUrl,
        this.sourceDomain,
        this.pubDateMs,
        this.podcasts,
        this.total,
        this.listennotesUrl,
    });

    String id;
    String title;
    String description;
    String sourceUrl;
    String sourceDomain;
    int pubDateMs;
    List<CPodcast> podcasts;
    int total;
    String listennotesUrl;

    factory CuratedList.fromJson(Map<String, dynamic> json) => CuratedList(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        sourceUrl: json["source_url"],
        sourceDomain: json["source_domain"],
        pubDateMs: json["pub_date_ms"],
        podcasts: List<CPodcast>.from(json["podcasts"].map((x) => CPodcast.fromJson(x))),
        total: json["total"],
        listennotesUrl: json["listennotes_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "source_url": sourceUrl,
        "source_domain": sourceDomain,
        "pub_date_ms": pubDateMs,
        "podcasts": List<dynamic>.from(podcasts.map((x) => x.toJson())),
        "total": total,
        "listennotes_url": listennotesUrl,
    };
}

class CPodcast {
    CPodcast({
        this.id,
        this.title,
        this.publisher,
        this.image,
        this.thumbnail,
        this.listennotesUrl,
        this.listenScore,
        this.listenScoreGlobalRank,
    });

    String id;
    String title;
    String publisher;
    String image;
    String thumbnail;
    String listennotesUrl;
    ListenScore listenScore;
    ListenScore listenScoreGlobalRank;

    factory CPodcast.fromJson(Map<String, dynamic> json) => CPodcast(
        id: json["id"],
        title: json["title"],
        publisher: json["publisher"],
        image: json["image"],
        thumbnail: json["thumbnail"],
        listennotesUrl: json["listennotes_url"],
        listenScore: listenScoreValues.map[json["listen_score"]],
        listenScoreGlobalRank: listenScoreValues.map[json["listen_score_global_rank"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "publisher": publisher,
        "image": image,
        "thumbnail": thumbnail,
        "listennotes_url": listennotesUrl,
        "listen_score": listenScoreValues.reverse[listenScore],
        "listen_score_global_rank": listenScoreValues.reverse[listenScoreGlobalRank],
    };
}

enum ListenScore { PLEASE_UPGRADE_TO_PRO_OR_ENTERPRISE_PLAN_TO_SEE_THIS_FIELD }

final listenScoreValues = EnumValues({
    "Please upgrade to PRO or ENTERPRISE plan to see this field": ListenScore.PLEASE_UPGRADE_TO_PRO_OR_ENTERPRISE_PLAN_TO_SEE_THIS_FIELD
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
