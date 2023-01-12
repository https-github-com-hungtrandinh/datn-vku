class ListIdRecommender{
  final List<String> data;
  ListIdRecommender({required this.data});

  factory ListIdRecommender.fromJson(Map<String, dynamic> json){
    return ListIdRecommender(data: json["data"]);
  }
}