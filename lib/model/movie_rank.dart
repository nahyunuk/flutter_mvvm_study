class MovieRank {
  String? rank; // 박스오피스 순위
  String? movieNm; // 영화명;
  String? rankInten; // 전일대비 순위의 증감분

  MovieRank({
    required this.rank,
    required this.movieNm,
    required this.rankInten,
  });

  factory MovieRank.formJson(Map<String, dynamic> json) {
    return MovieRank(
      rank: json['rank'],
      movieNm: json['movieNm'],
      rankInten: json['rankInten'],
    );
  }
}
