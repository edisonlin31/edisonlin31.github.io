import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class Menu with _$Menu {
  const Menu._();
  factory Menu(
      {required int id,
      required String title,
      @JsonKey(name: "short_title") required String shortTitle,
      @JsonKey(name: "price") required String priceString,
      required List<MenuImage> images,
      @Default(0) int cartQty}) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}

@freezed
class MenuImage with _$MenuImage {
  const MenuImage._();
  factory MenuImage({
    required int position,
    required String src,
  }) = _MenuImage;

  factory MenuImage.fromJson(Map<String, dynamic> json) =>
      _$MenuImageFromJson(json);
}

extension MenuExtension on Menu {
  double get basePrice {
    return (double.parse(priceString));
  }

  double get basePriceByQuantity {
    String inString = (basePrice * cartQty).toStringAsFixed(2);
    return double.parse(inString);
  }

  double get price {
    return basePrice - (basePrice * 30 / 100);
  }

  double get priceByQuantity {
    String inString = (price * cartQty).toStringAsFixed(2);
    return double.parse(inString);
  }

  String get imageUrl {
    if (images.isNotEmpty) {
      return images[0].src;
    }
    return 'https://i.ibb.co/55LXf4T/food-1.jpg';
  }
}
