import 'package:flutter/material.dart';
import '../models/models.dart';

class PromoBox extends StatelessWidget {
  final Promo promo;

  const PromoBox({Key? key, required this.promo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 8),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(promo.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5.0),
              color: Theme.of(context).primaryColor),
        ),
        ClipPath(
          clipper: PromoCustomClipper(),
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Theme.of(context).primaryColor),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 140),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    promo.title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    promo.description,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PromoCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(230, size.height);
    path.lineTo(240, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
