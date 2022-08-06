import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/models/models.dart';
import '../../blocs/filters/filters_bloc.dart';
import '../../widgets/widgets.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  static const String routeName = '/filter';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const FilterScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("filters"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<FiltersBloc, FiltersState>(
              builder: (context, state) {
                if (state is FiltersLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                }
                if (state is FiltersLoaded) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: const RoundedRectangleBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                    ),
                    child: const Text('Apply'),
                    onPressed: () {
                      var categories = state.filter.categoryFilters
                          .where((filter) => filter.value)
                          .map((filter) => filter.category.name)
                          .toList();
                      var prices = state.filter.priceFilters
                          .where((filter) => filter.value)
                          .map((filter) => filter.price.price)
                          .toList();
                      List<Restaurant> restaurants = Restaurant.restaurants
                          .where(
                            (restaurant) => categories.any(
                              (category) => restaurant.tags.contains(category),
                            ),
                          )
                          .where(
                            (restaurant) => prices.any(
                              (price) =>
                                  restaurant.priceCategory.contains(price),
                            ),
                          )
                          .toList();

                      Navigator.pushNamed(context, '/restaurant List',
                          arguments: restaurants);
                    },
                  );
                } else {
                  return const Center(
                    child: Text("Something Went Wrong"),
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            const CustomPriceFilter(),
            Text(
              'Category',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            const CustomCategoryFilter(),
          ],
        ),
      ),
    );
  }
}
