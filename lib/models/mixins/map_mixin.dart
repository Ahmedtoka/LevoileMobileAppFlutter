import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inspireui/extensions/color_extension.dart';
import 'package:inspireui/utils/logs.dart';
import 'package:location/location.dart';

import '../../common/config.dart';
import '../entities/prediction.dart';

mixin MapMixin {
  Prediction? currentLocation;
  Set<Circle> circles = <Circle>{};
  Set<Marker> markers = <Marker>{};

  late GoogleMapController mapController;
  late CameraPosition currentUserLocation;

  var zoom = 15.0;
  var radius = kAdvanceConfig.queryRadiusDistance * 1.0;
  var minRadius = kAdvanceConfig.minQueryRadiusDistance * 1.0;
  var maxRadius = kAdvanceConfig.maxQueryRadiusDistance * 1.0;

  void updateRadius(double radius) {
    this.radius = radius;
    circles = {
      Circle(
        circleId: const CircleId('currentLocation'),
        center: currentLocation?.latLng ?? const LatLng(0, 0),
        radius: this.radius * 1000,
        fillColor: Colors.blue.withValueOpacity(0.3),
        strokeColor: Colors.blue,
        strokeWidth: 1,
      ),
    };
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void onGeoChanged(CameraPosition position) {
    zoom = position.zoom;
  }

  Future<void> getUserCurrentLocation() async {
    try {
      var location = Location();
      var locationData = await location.getLocation();

      if (locationData.latitude != null && locationData.longitude != null) {
        currentLocation = Prediction()
          ..lat = locationData.latitude!.toString()
          ..long = locationData.longitude!.toString();

        currentUserLocation = CameraPosition(
          target: currentLocation!.latLng,
          zoom: zoom,
        );
        circles = {
          Circle(
            circleId: const CircleId('currentLocation'),
            center: currentLocation!.latLng,
            radius: radius * 1000,
            fillColor: Colors.blue.withValueOpacity(0.3),
            strokeColor: Colors.blue,
            strokeWidth: 1,
          ),
        };
      }
    } catch (e) {
      printLog('getUserCurrentLocation error: $e');
    }
  }

  void updateCurrentLocation(Prediction prediction) {
    currentLocation = prediction;
    moveToCurrentPos(isSearch: true);
    updateRadius(radius);
  }

  Future<void> moveToCurrentPos({bool isSearch = false}) async {
    if (!isSearch) await getUserCurrentLocation();
    if (currentLocation != null) {
      await mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: currentLocation!.latLng, zoom: zoom),
        ),
      );
    }
  }

  void zoomIn() {
    mapController.animateCamera(CameraUpdate.zoomIn());
  }

  void zoomOut() {
    mapController.animateCamera(CameraUpdate.zoomOut());
  }
}
