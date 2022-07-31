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
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const PromoBox();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(
                    child: SearchBox(
                      hintText: "What would you like to eat?",
                      borderColor: Colors.black,
                      underLineColor: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    width: 50,
                    height: 50,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Top Rated',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
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
