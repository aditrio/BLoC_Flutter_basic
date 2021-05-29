import 'package:bloc_sample/models/animeList.dart';

abstract class AnimeState {}

class AnimeInitialState extends AnimeState {}

class AnimeLoadInProgressState extends AnimeState {}

class AnimeLoadSuccessState extends AnimeState {
  final List<dynamic> animeLists;
  final List<dynamic> animePages;

  AnimeLoadSuccessState({required this.animeLists, required this.animePages});
}

class AnimeLoadFailedState extends AnimeState {
  final String error;

  AnimeLoadFailedState({required this.error});
}
