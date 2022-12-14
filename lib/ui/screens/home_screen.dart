import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Expanded(
                child: SearchBox(
                  hintText: "Search in Thousand of Product",
                  borderColor: Colors.black,
                  underLineColor: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Address.address.length,
                  itemBuilder: (context, index) {
                    return AddressBox(
                      addressName: Address.address[index].addressName,
                      streetName: Address.address[index].streetName,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore by category',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/filter');
                    },
                    child: Text(
                      'Detailed Filter',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Category.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryBox(
                      category: Category.categories[index],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Deals of the Day',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Promo.proms.length,
                  itemBuilder: (context, index) {
                    return PromoBox(promo: Promo.proms[index]);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Top Rated Restaurants',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Restaurant.restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(
                    restaurant: Restaurant.restaurants[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
