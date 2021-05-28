import 'package:bloc_sample/bloc/animeBloc.dart';
import 'package:bloc_sample/bloc/animeState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("AniDex")),
        body: BlocBuilder<AnimeBloc, AnimeState>(builder: (context, state) {
          if (state is AnimeLoadSuccessState) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: state.animeLists.length,
              itemBuilder: (context, index) {
                return Card(
                  child: GridTile(
                    child: Column(
                      children: [
                        Image.network(state.animeLists[index].urlCover),
                        Text(state.animeLists[index].title)
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is AnimeLoadInProgressState) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else if (state is AnimeLoadFailedState) {
            return Center(child: Text(state.error.toString()));
          } else {
            return Container();
          }
        }));
  }
}
