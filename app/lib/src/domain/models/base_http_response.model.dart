class BaseHttpResponse {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<dynamic>? results;

  BaseHttpResponse({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  @override
  factory BaseHttpResponse.fromJson(Map<String, dynamic> json) =>
      BaseHttpResponse(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<dynamic>.from(json["results"].map((x) => x)),
      );
}
