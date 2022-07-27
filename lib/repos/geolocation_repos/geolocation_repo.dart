import 'package:food_delivery_app/repos/geolocation_repos/base_geolocation_repo.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationRepo extends BaseGeolocationRepo {
  GeolocationRepo();

  @override
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
