import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/movie_rank.dart';

class DataSource {
  Future<List<MovieRank>> getMovieRankList(String targetDt) async {
    const String apiKey = 'c1e9d78b5554e072b6fdfc14a989cc42'; // api key
    // HTTP GET 요청을 보냄
    final response = await http.get(Uri.parse(
        'https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=$apiKey&targetDt=$targetDt'));

    // HTTP 요청 성공 여부를 확인
    if (response.statusCode == 200) {
      // 성공시

      // HTTP 요청의 응답 본문을 JSON 문자열을 Dart 객체로 변환
      final data = jsonDecode(response.body);
      // data 출력
      print(data);

      // 리스트로 변환 값이 없을 경우 빈 리스트 반환
      var movieRankList = data['boxOfficeResult']['dailyBoxOfficeList'] as List;

      // 만약 movieRankList가 비었다면
      if (movieRankList.isEmpty) {
        print("No movies found");
      }

      // MovieRank라는 사용자 정의 클래스의 객체로 매핑한 뒤, 리스트로 변환
      return movieRankList
          .map<MovieRank>((json) => MovieRank.fromJson(json))
          .toList();
    }

    else {
      // 요청 실패시
      throw Exception('Failed to load movie list');
    }
  }
}
