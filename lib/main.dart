import 'package:flutter/material.dart';
import 'package:mvvm_moive_api_rank/view/movie_rank_view.dart';
import 'package:mvvm_moive_api_rank/viewModel/movie_rank_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<MovieRankViewModel>(
        create: (context) => MovieRankViewModel(),
        child: MovieRankView(),
      ),
    );
  }
}
