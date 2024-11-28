import 'package:flutter/material.dart';
import '../model/movie_rank.dart';
import '../repository/movie_rank_repository.dart';

class MovieRankViewModel with ChangeNotifier {
  String targetDt = '20081024';
  bool _isLoading = false; // 중복 로딩 방지
  // 데이터를 가져오는 역할을 담당하는 Repository
  late final MovieRankRepository _movieRankRepository;
  // 영화 순위 데이터를 저장하는 리스트입니다.
  List<MovieRank> _movieRankList = List.empty(growable: true);
  // 외부에서 영화 데이터를 읽을 수 있도록 제공하는 getter입니다.
  List<MovieRank> get movieRankList => _movieRankList;

  // 데이터를 가져오기 위한 함수로, 로딩 중복 방지와 상태 업데이트를 처리
  Future<void> _getMovieRankList() async {
    if (_isLoading) return; // 이미 로딩 중이면 실행하지 않음
    _isLoading = true;

    _movieRankList = await _movieRankRepository.getMovieRank(targetDt);
    _isLoading = false;
    // View에게 상태 변경을 통지
    notifyListeners();
  }
  // MovieRankViewModel 생성자
  MovieRankViewModel() {
    _movieRankRepository = MovieRankRepository();
    // 영화 순위 데이터를 가져옵니다.
    _getMovieRankList();
  }
}
