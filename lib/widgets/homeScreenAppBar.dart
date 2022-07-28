import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.person),
        onPressed: () {},
      ),
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Location',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Colors.white),
          ),
          Text(
            'lat , lng',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
