import 'package:mvvm_moive_api_rank/dataSource/dataSource.dart';
import 'package:mvvm_moive_api_rank/model/movie_rank.dart';

class MovieRankRepository {
  // 데이터에 접근하기 위한 객체
  final DataSource _dataSource = DataSource();

  Future<List<MovieRank>> getMovieRank(String targetDt) {
    // getMovieRankList 메서드를 호출
    return _dataSource.getMovieRankList(targetDt);
  }
}
