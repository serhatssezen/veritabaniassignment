import 'Genres.dart';
import 'ShortScreenshots.dart';

class Store {
  String? name;
  String? image;

  Store(this.name, this.image);

  Store.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}


