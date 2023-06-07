import 'Genres.dart';
import 'ShortScreenshots.dart';
import 'Store.dart';

class Comments {
  String? comment;
  String? username;

  Comments(this.comment, this.username);

  Comments.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    if (json['user'] != null) {
      username = json['user']['username'];
    }
  }
}


