import 'package:flutter/material.dart';
import 'package:mvvm_moive_api_rank/model/movie_rank.dart';
import 'package:provider/provider.dart';
import '../viewModel/movie_rank_view_model.dart';

class MovieRankView extends StatefulWidget {
  const MovieRankView({super.key});

  @override
  State<MovieRankView> createState() => _MovieRankViewState();
}

class _MovieRankViewState extends State<MovieRankView> {
  late List<MovieRank> movieRankList;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieRankViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('영화 랭크'),
        ),
        body: Consumer<MovieRankViewModel>(
          builder: (context, value, child) {
            final movieRankList = value.movieRankList;
            return ListView.builder(
              itemCount: movieRankList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          '${movieRankList[index].rank}. ${movieRankList[index].movieNm}'),
                      Text(
                        '${movieRankList[index].rankInten}',
                        style: TextStyle(
                          color:  int.parse(movieRankList[index].rankInten ?? '0') < 1
                                  ? Colors.blue
                                  : Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
