import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/basket/basket_bloc.dart';
import '../models/models.dart';

Widget buildMenuItem(Restaurant restaurant, BuildContext context, int index) {
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
                          BlocBuilder<BasketBloc, BasketState>(
                            builder: (context, state) {
                              return IconButton(
                                onPressed: () {
                                  context.read<BasketBloc>().add(
                                        AddItem(item: menuItem),
                                      );
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                              );
                            },
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
