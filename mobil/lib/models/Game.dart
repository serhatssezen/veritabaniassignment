import 'Comment.dart';
import 'GamePrices.dart';
import 'Genres.dart';
import 'ShortScreenshots.dart';

class Game {
  int? id;
  String? slug;
  String? name;
  String? released;
  String? backgroundImage;
  double? rating;
  int? ratingTop;
  List<ShortScreenshots> shortScreenshots = [];
  List<Genres> genres = [];
  List<GamePrices> prices = [];
  List<Comments> comments = [];

  Game(
      this.id,
      this.slug,
      this.name,
      this.released,
      this.backgroundImage,
      this.rating,
      this.ratingTop,
      this.shortScreenshots,
      this.genres,
      this.comments);

  Game.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    released = json['released'];
    backgroundImage = json['backgroundImage'];
    rating = json['rating'];
    ratingTop = json['rating_top'];
    if (json['shortScreenshots'] != null) {
      shortScreenshots = [];
      json['shortScreenshots'].forEach((v) {
        shortScreenshots.add(ShortScreenshots.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres.add(Genres.fromJson(v));
      });
    }
    if (json['prices'] != null) {
      prices = [];
      json['prices'].forEach((v) {
        prices.add(GamePrices.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = [];
      json['comments'].forEach((v) {
        comments.add(Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    data['name'] = name;
    data['released'] = released;
    data['background_image'] = backgroundImage;
    data['rating'] = rating;
    data['rating_top'] = ratingTop;
    data['short_screenshots'] = shortScreenshots.map((v) => v.toJson()).toList();
    data['genres'] = genres.map((v) => v.toJson()).toList();
    return data;
  }
}


