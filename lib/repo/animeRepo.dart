import 'dart:convert';

import 'package:bloc_sample/models/animeList.dart';
import 'package:http/http.dart' as http;

class AnimeRepository {
  final baseUrl = 'kitsu.io';
  final client = http.Client();

  Future<AnimeResponse> getAnime(int pageIndex) async {
    final queryParams = {
      "page": {
        "limit": '20',
        "offset": (pageIndex * 20).toString(),
      }
    };

    final uri = Uri.https(baseUrl, '/api/edge/anime', queryParams);

    final response = await client.get(uri);

    final json = jsonDecode(response.body);

    print("data : " + json.toString());

    return AnimeResponse.fromJSON(json);
  }
}
