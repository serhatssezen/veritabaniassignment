import 'Genres.dart';
import 'ShortScreenshots.dart';
import 'Store.dart';

class GamePrices {
  double? price;
  Store? store;

  GamePrices(this.price, this.store);

  GamePrices.fromJson(Map<String, dynamic> json) {
    price = json['price'] ?? 2.49;
    if (json['store'] != null) {
      store = Store.fromJson(json['store']);
    }
  }
}


