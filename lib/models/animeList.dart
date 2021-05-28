class AnimeList {
  final int id;
  final String title;
  final String synopsis;
  final String rating;
  final String episodes;
  final String urlBanner;
  final String urlCover;

  AnimeList(
      {required this.id,
      required this.title,
      required this.synopsis,
      required this.rating,
      required this.episodes,
      required this.urlBanner,
      required this.urlCover});

  factory AnimeList.fromJSON(Map<String, dynamic> json) {
    final id = json["id"];
    final title = json["attributes"]["titles"]["canonicalTitle"] as String;
    final synopsis = json["attributes"]["synopsis"] as String;
    final rating = json["attributes"]["averageRating"] as String;
    final episodes = json["attributes"]["episodeCount"] as String;
    final urlBanner = json["attributes"]["coverImage"]["tiny"] as String;
    final urlCover = json["attributes"]["posterImage"]["tiny"] as String;

    return AnimeList(
        id: id,
        title: title,
        synopsis: synopsis,
        rating: rating,
        episodes: episodes,
        urlBanner: urlBanner,
        urlCover: urlCover);
  }
}

class AnimeResponse {
  final List<AnimeList> animeLists;
  final bool canLoadNextPage;

  AnimeResponse({required this.animeLists, required this.canLoadNextPage});

  factory AnimeResponse.fromJSON(Map<String, dynamic> json) {
    final canLoadNextPage = json["links"]["next"] == null ? false : true;
    final animeLists =
        (json["data"] as List).map((e) => AnimeList.fromJSON(e)).toList();
    return AnimeResponse(
        animeLists: animeLists, canLoadNextPage: canLoadNextPage);
  }
}
