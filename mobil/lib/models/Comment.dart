import 'Genres.dart';
import 'ShortScreenshots.dart';
import 'Store.dart';

class Comment {
  String? comment;
  String? username;

  Comment(this.comment, this.username);

  Comment.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    if (json['user'] != null) {
      username = json['user']['username'];
    }
  }
}


