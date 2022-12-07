// To parse this JSON data, do
//
//     final bestPodcast = bestPodcastFromJson(jsonString);

import 'dart:convert';

import 'package:provider_demo/core/models/podcast.dart';

BestPodcast bestPodcastFromJson(String str) => BestPodcast.fromJson(json.decode(str));

String bestPodcastToJson(BestPodcast data) => json.encode(data.toJson());

class BestPodcast {
    BestPodcast({
        this.id,
        this.name,
        this.parentId,
        this.podcasts,
        this.total,
        this.hasNext,
        this.hasPrevious,
        this.pageNumber,
        this.previousPageNumber,
        this.nextPageNumber,
        this.listennotesUrl,
    });

    int id;
    String name;
    dynamic parentId;
    List<Podcast> podcasts;
    int total;
    bool hasNext;
    bool hasPrevious;
    int pageNumber;
    int previousPageNumber;
    int nextPageNumber;
    String listennotesUrl;

    factory BestPodcast.fromJson(Map<String, dynamic> json) => BestPodcast(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        podcasts: List<Podcast>.from(json["podcasts"].map((x) => Podcast.fromJson(x))),
        total: json["total"],
        hasNext: json["has_next"],
        hasPrevious: json["has_previous"],
        pageNumber: json["page_number"],
        previousPageNumber: json["previous_page_number"],
        nextPageNumber: json["next_page_number"],
        listennotesUrl: json["listennotes_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "podcasts": List<dynamic>.from(podcasts.map((x) => x.toJson())),
        "total": total,
        "has_next": hasNext,
        "has_previous": hasPrevious,
        "page_number": pageNumber,
        "previous_page_number": previousPageNumber,
        "next_page_number": nextPageNumber,
        "listennotes_url": listennotesUrl,
    };
}




