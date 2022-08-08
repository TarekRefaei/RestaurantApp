import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/basket/basket_bloc.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  static const String routeName = '/basket';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const BasketScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Basket",
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/edit_basket');
        //     },
        //     icon: const Icon(Icons.edit),
        //   ),
        // ],
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
              onPressed: () {
                // Navigator.pushNamed(context, '/basket');
              },
              child: const Text('Check Out'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "Cutlery",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Do You want Cutlery?",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        if (state is BasketLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is BasketLoaded) {
                          return SizedBox(
                            width: 100,
                            child: SwitchListTile(
                              dense: false,
                              onChanged: (bool value) {
                                context
                                    .read<BasketBloc>()
                                    .add(const ToggleSwitch());
                              },
                              value: state.basket.cutlery,
                            ),
                          );
                        } else {
                          return const Center(
                            child: Text("Something Went Wrong"),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
              Text(
                "Items",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
              BlocBuilder<BasketBloc, BasketState>(
                builder: (context, state) {
                  if (state is BasketLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is BasketLoaded) {
                    return state.basket.items.isEmpty
                        ? Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Basket is Empty',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: state.basket
                                .itemQuantity(state.basket.items)
                                .keys
                                .length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                width: double.infinity,
                                margin: const EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}× ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            context.read<BasketBloc>().add(
                                                RemoveAllItem(
                                                    item: state.basket
                                                        .itemQuantity(
                                                            state.basket.items)
                                                        .keys
                                                        .elementAt(index)));
                                          },
                                          icon: const Icon(Icons.delete),
                                          visualDensity: VisualDensity.compact,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            context.read<BasketBloc>().add(
                                                RemoveItem(
                                                    item: state.basket
                                                        .itemQuantity(
                                                            state.basket.items)
                                                        .keys
                                                        .elementAt(index)));
                                          },
                                          icon: const Icon(Icons.remove_circle),
                                          visualDensity: VisualDensity.compact,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            context.read<BasketBloc>().add(
                                                AddItem(
                                                    item: state.basket
                                                        .itemQuantity(
                                                            state.basket.items)
                                                        .keys
                                                        .elementAt(index)));
                                          },
                                          icon: const Icon(Icons.add_circle),
                                          visualDensity: VisualDensity.compact,
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    ),
                                    Text(
                                      "\$${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).price}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                  } else {
                    return const Center(
                      child: Text("Something Went Wrong"),
                    );
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/logo/deliverylogo.png'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Delivery in 20 Minutes",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Change",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        if (state is BasketLoaded) {
                          return state.basket.voucher == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Do you Have a voucher?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/voucher');
                                      },
                                      child: Text(
                                        "Apply",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                      ),
                                    ),
                                  ],
                                )
                              : Text(
                                  'Your Voucher is Added !',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                );
                        } else {
                          return const Center(
                            child: Text("Something Went Wrong"),
                          );
                        }
                      },
                    ),
                    Image.asset('assets/logo/voucher.jpg'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: BlocBuilder<BasketBloc, BasketState>(
                  builder: (context, state) {
                    if (state is BasketLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is BasketLoaded) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "SubTotal",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                              Text(
                                "\$${state.basket.subtotalString}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery Fee",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                              Text(
                                "\$50",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                          Container(
                            color: Colors.red.withAlpha(500),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(color: Colors.black),
                                ),
                                Text(
                                  "\$${state.basket.totalString}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text("Something Went Wrong"),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
