abstract class AnimeEvent {}

class AnimePageRequest extends AnimeEvent {
  final int page;

  AnimePageRequest({required this.page});
}
