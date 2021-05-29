class AnimeList {
  final String id;
  final List<AnimeDetail> details;
  AnimeList({required this.id, required this.details});

  factory AnimeList.fromJSON(Map<String, dynamic> json) {
    final id = json["id"];
    final details = (json["attributes"] as List)
        .map((e) => AnimeDetail.fromJSON(e))
        .toList();
    return AnimeList(
      id: id,
      details: details,
    );
  }
}

class AnimeDetail {
  final String title;
  final String rating;
  final List<AnimePoster> urlPoster;
  final List<AnimeCover> urlCover;
  final String episode;
  final String synopsis;

  AnimeDetail(
      {required this.title,
      required this.rating,
      required this.urlPoster,
      required this.urlCover,
      required this.episode,
      required this.synopsis});

  factory AnimeDetail.fromJSON(Map<String, dynamic> json) {
    final String title = json["cannonicalTitle"];
    final String rating = json["averageRating"];
    final urlPoster = (json["posterImage"] as List)
        .map((e) => AnimePoster.fromJSON(e))
        .toList();
    final urlCover = (json["coverImage"] as List)
        .map((e) => AnimeCover.fromJSON(e))
        .toList();
    final String episode = json["episodeCount"];
    final String synopsis = json["synopsis"];

    return AnimeDetail(
        title: title,
        rating: rating,
        urlPoster: urlPoster,
        urlCover: urlCover,
        episode: episode,
        synopsis: synopsis);
  }
}

class AnimePoster {
  final String small;
  final String large;

  AnimePoster({required this.small, required this.large});

  factory AnimePoster.fromJSON(Map<String, dynamic> json) {
    final String small = json["small"];
    final String large = json["large"];

    return AnimePoster(small: small, large: large);
  }
}

class AnimeCover {
  final String small;
  final String large;

  AnimeCover({required this.small, required this.large});

  factory AnimeCover.fromJSON(Map<String, dynamic> json) {
    final String small = json["small"];
    final String large = json["large"];

    return AnimeCover(small: small, large: large);
  }
}

class AnimePage {
  final String next;
  final String previous;
  final String last;
  final String first;

  AnimePage({
    required this.next,
    required this.previous,
    required this.last,
    required this.first,
  });

  factory AnimePage.fromJSON(Map<String, dynamic> json) {
    final String next = json["next"];
    final String previous = json["previous"];
    final String last = json["last"];
    final String first = json["first"];

    return AnimePage(next: next, previous: previous, last: last, first: first);
  }
}

class AnimeResponse {
  final List<AnimeList> animeLists;
  final List<AnimePage> animePages;

  AnimeResponse({required this.animeLists, required this.animePages});

  factory AnimeResponse.fromJSON(Map<String, dynamic> json) {
    final animePages =
        (json["links"] as List).map((e) => AnimePage.fromJSON(e)).toList();

    final animeLists =
        (json["data"] as List).map((e) => AnimeList.fromJSON(e)).toList();
    return AnimeResponse(animeLists: animeLists, animePages: animePages);
  }
}
