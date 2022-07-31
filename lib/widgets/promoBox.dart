import 'package:flutter/material.dart';

import '../config/const.dart';

class PromoBox extends StatelessWidget {
  const PromoBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 8),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(promoUrl),
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
                    promoText,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    promoDescription,
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
