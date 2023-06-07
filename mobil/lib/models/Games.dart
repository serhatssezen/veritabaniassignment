import 'Game.dart';

class Games {
  int? count;
  String? next;
  String? previous;
  List<Game> results = [];

  Games(this.count, this.next, this.previous, this.results);

  Games.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        results.add(Game.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    data['results'] = this.results.map((v) => v.toJson()).toList();
    return data;
  }
}