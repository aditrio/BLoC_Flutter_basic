import 'package:bloc_sample/repo/animeRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_sample/bloc/animeEvent.dart';
import 'package:bloc_sample/bloc/animeState.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  AnimeBloc() : super(AnimeInitialState());
  final _animeRepo = AnimeRepository();
  @override
  Stream<AnimeState> mapEventToState(AnimeEvent event) async* {
    // TODO: implement mapEventToState
    if (event is AnimePageRequest) {
      yield AnimeLoadInProgressState();
      try {
        final animePageResponse = await _animeRepo.getAnime(0);
        yield AnimeLoadSuccessState(
            animeLists: animePageResponse.animeLists,
            animePages: animePageResponse.animePages);
      } catch (e) {
        yield AnimeLoadFailedState(error: e.toString());
        print(e.toString());
      }
    }
  }
}
