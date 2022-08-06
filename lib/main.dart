import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/blocs/filters/filters_bloc.dart';
import 'package:food_delivery_app/blocs/geolocation/geolocation_bloc.dart';
import 'package:food_delivery_app/config/app_router.dart';
import 'package:food_delivery_app/config/theme.dart';
import 'package:food_delivery_app/repos/geolocation_repos/geolocation_repo.dart';
import 'package:food_delivery_app/ui/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => GeolocationRepo())
        // RepositoryProvider<GeolocationRepo>(
        //   create: () => GeolocationRepo(),
        // )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GeolocationBloc(
              geolocationRepo: context.read<GeolocationRepo>(),
            )..add(
                LoadGeolocation(),
              ),
          ),
          BlocProvider(
            create: (context) => FiltersBloc()
              ..add(
                LoadFilter(),
              ),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: appTheme(),
          debugShowCheckedModeBanner: false,
          initialRoute: HomeScreen.routeName,
          onGenerateRoute: AppRouter.onGeneratedRoute,
        ),
      ),
    );
  }
}
