import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  const Promo(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl});

  @override
  List<Object?> get props => [id, title, description, imageUrl];

  static List<Promo> proms = [
    const Promo(
        id: 1,
        title: "3 orders Free",
        description: "Delivery For Free on Your 3 orders",
        imageUrl:
            'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/106036034/original/70702a7ec94ab93163233cfa57d7016908475920/create-restaurant-promo-or-food-promotion-video.jpg'),
    const Promo(
        id: 2,
        title: "3 orders",
        description: "Delivery For Free on Your 3 orders",
        imageUrl:
            'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/106036034/original/70702a7ec94ab93163233cfa57d7016908475920/create-restaurant-promo-or-food-promotion-video.jpg'),
  ];
}
