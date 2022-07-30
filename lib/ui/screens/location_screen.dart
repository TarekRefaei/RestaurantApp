import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/widgets/search_box.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../blocs/geolocation/geolocation_bloc.dart';
import '../../widgets/g_map.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const LocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(10, 10),
                zoom: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// SizedBox(
// width: double.infinity,
// height: MediaQuery.of(context).size.height,
// child: BlocBuilder<GeolocationBloc, GeolocationState>(
// builder: (context, state) {
// if (state is GeolocationLoading) {
// return const Center(
// child: CircularProgressIndicator(),
// );
// } else if (state is GeolocationLoaded) {
// return GMap(
// lat: state.position.latitude,
// lng: state.position.longitude,
// );
// } else {
// return const Center(
// child: Text("SomThing Went Wrong"),
// );
// }
// },
// ),
// ),
// Positioned(
// top: 40,
// left: 20,
// right: 20,
// child: SizedBox(
// height: 100,
// child: Row(
// children: [
// Image.asset(
// "assets/logo/logo.png",
// height: 50,
// ),
// const SizedBox(width: 10),
// const SearchBox(
// hintText: "Enter Your Location",
// borderColor: Colors.white,
// underLineColor: Colors.white,
// )
// ],
// ),
// ),
// ),
