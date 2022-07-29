import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/repos/geolocation_repos/geolocation_repo.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_event.dart';

part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepo _geolocationRepo;
  StreamSubscription? _geolocationStream;

  GeolocationBloc({required GeolocationRepo geolocationRepo})
      : _geolocationRepo = geolocationRepo,
        super(GeolocationLoading()) {
    Stream<GeolocationState> mapEventToState(GeolocationEvent event) async* {
      if (event is LoadGeolocation) {
        yield* _mapLoadGeoToState();
      } else if (event is UpdateGeolocation) {
        yield* _mapUpdateGeoToState(event);
      }
    }
  }

  Stream<GeolocationState> _mapLoadGeoToState() async* {
    _geolocationStream?.cancel();
    final Position position = await _geolocationRepo.getCurrentLocation();
    add(UpdateGeolocation(position: position));
  }

  Stream<GeolocationState> _mapUpdateGeoToState(
      UpdateGeolocation event) async* {
    yield GeolocationLoaded(position: event.position);
  }

  @override
  Future<void> close() {
    _geolocationStream?.cancel();
    return super.close();
  }
}
