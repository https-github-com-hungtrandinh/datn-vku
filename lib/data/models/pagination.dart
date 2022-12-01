class Pagination {
  final int total;
  final int skip;
  final int limit;

  Pagination({required this.total, required this.skip, required this.limit});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
        total: json['total'], skip: json['skip'], limit: json['limit']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}
