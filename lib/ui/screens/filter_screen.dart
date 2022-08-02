import 'package:flutter/material.dart';

import '../../models/models.dart';

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
            CustomPriceFilter(prices: Price.prices),
            Text(
              'Category',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            CustomCategoryFilter(categories: Category.categories),
          ],
        ),
      ),
    );
  }
}

class CustomCategoryFilter extends StatelessWidget {
  final List<Category> categories;

  const CustomCategoryFilter({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categories[index].name,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 25,
                child: Checkbox(
                  value: false,
                  onChanged: (bool? newValue) {},
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter({Key? key, required this.prices}) : super(key: key);

  final List<Price> prices;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: prices
          .map(
            (price) => InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  price.price,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
