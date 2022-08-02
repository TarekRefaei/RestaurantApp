import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({Key? key, required this.restaurant})
      : super(key: key);

  final Restaurant restaurant;

  static const String routeName = '/restaurant_details';

  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
      builder: (context) => RestaurantDetailsScreen(
        restaurant: restaurant,
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                shape: const RoundedRectangleBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 50),
              ),
              onPressed: () {},
              child: const Text('Basket'),
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom:
                      Radius.elliptical(MediaQuery.of(context).size.width, 50),
                ),
                image: DecorationImage(
                  image: NetworkImage(restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            RestaurantInfo(restaurant: restaurant),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: restaurant.tags.length,
              itemBuilder: (context, index) {
                return _buildMenuItem(restaurant, context, index);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      Restaurant restaurant, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            restaurant.tags[index],
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
        Column(
          children: restaurant.menuItems
              .where((menuItem) => menuItem.category == restaurant.tags[index])
              .map(
                (menuItem) => Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        dense: true,
                        title: Text(
                          menuItem.name,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        subtitle: Text(
                          menuItem.description,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '\$${menuItem.price}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(height: 4)
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
