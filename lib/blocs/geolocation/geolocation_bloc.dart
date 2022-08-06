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
    on<LoadGeolocation>(_mapLoadGeoToState);
    on<UpdateGeolocation>(_mapUpdateGeoToState);
  }

  FutureOr<void> _mapLoadGeoToState(
      LoadGeolocation event, Emitter<GeolocationState> emit) async* {
    _geolocationStream?.cancel();
    final Position position = await _geolocationRepo.getCurrentLocation();
    add(UpdateGeolocation(position: position));
  }

  FutureOr<void> _mapUpdateGeoToState(
      UpdateGeolocation event, Emitter<GeolocationState> emit) async* {
    yield GeolocationLoaded(position: event.position);
  }

  @override
  Future<void> close() {
    _geolocationStream?.cancel();
    return super.close();
  }
}
