import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../consts/app_const.dart';
import '../../../consts/app_images.dart';

class HomePageController extends GetxController {
  var pickup = ''.obs;
  var destination = 'Choose destination'.obs;
  var price = ''.obs;
  var distance = ''.obs;
  var duration = ''.obs;
  var isDestinationSelect = false.obs;

  var currentLat = 0.0.obs;
  var currentLon = 0.0.obs;
  var destinationLatLon = const LatLng(0.0, 0.0).obs;

  var marker = <Marker>[].obs;
  var polyline = <Polyline>[].obs;

  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  final CameraPosition kGooglePlex = const CameraPosition(target: LatLng(61.9241, 25.7482), zoom: 10);

  @override
  void onInit() async {
    super.onInit();
    await loadCurrentLocation();
  }

  Future<void> loadCurrentLocation() async {
    final locationData = await getCurrentLocation();
    if (locationData != null) {
      currentLat.value = locationData.latitude ?? 0.0;
      currentLon.value = locationData.longitude ?? 0.0;

      await animateCameraTo(LatLng(currentLat.value, currentLon.value), 17);
      await setPinMarker();
      pickup.value = await getStreetName(currentLat.value, currentLon.value);
    }
  }

  Future<void> addDestinationMarker(LatLng position) async {
    await addMarker(position, AppImages.des, '2', 'Destination');
    destinationLatLon.value = position;
    destination.value = await getStreetName(position.latitude, position.longitude);
    await setPolylineDirections();
  }

  Future<void> setPolylineDirections() async {
    PolylinePoints polylinePoints = PolylinePoints(apiKey: AppConst.googleMapApiKey);
    final response = await polylinePoints.getRouteBetweenCoordinatesV2(
      request: RoutesApiRequest(
        origin: PointLatLng(currentLat.value, currentLon.value),
        destination: PointLatLng(destinationLatLon.value.latitude, destinationLatLon.value.longitude),
        travelMode: TravelMode.driving,
        routingPreference: RoutingPreference.trafficAware,
      ),
    );

    if (response.routes.isNotEmpty) {
      final route = response.routes.first;
      final points = route.polylinePoints ?? [];
      polyline.add(Polyline(
        polylineId: const PolylineId('polyline_12'),
        color: Colors.deepOrange,
        width: 3,
        points: points.map((point) => LatLng(point.latitude, point.longitude)).toList(),
      ));

      isDestinationSelect.value = true;
      double km = (route.distanceKm ?? 0).toDouble();
      distance.value = '${km.toStringAsFixed(2)} km';
      duration.value = '${route.durationMinutes?.round()} min';
      price.value = km < 1 ? '€1' : '€${km.toStringAsFixed(2)}';
    }
  }

  Future<void> setPinMarker() async {
    await addMarker(LatLng(currentLat.value, currentLon.value), AppImages.pin, '1', 'Current Place');
  }

  Future<void> addMarker(LatLng position, String assetPath, String markerId, String title) async {
    final Uint8List markerIcon = await getBytesFromAsset(assetPath, 80);
    marker.add(Marker(
      markerId: MarkerId(markerId),
      position: position,
      icon: BitmapDescriptor.fromBytes(markerIcon),
      infoWindow: InfoWindow(title: title),
    ));
  }

  Future<String> getStreetName(double lat, double lon) async {
    final placemarks = await geo.placemarkFromCoordinates(lat, lon);
    return placemarks.first.street ?? 'Not Selected location';
  }

  Future<void> animateCameraTo(LatLng target, double zoom) async {
    final GoogleMapController control = await mapController.future;
    control.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: target, zoom: zoom)));
  }

  Future<LocationData?> getCurrentLocation() async {
    Location location = Location();
    if (!await location.serviceEnabled() && !await location.requestService()) return null;
    if (await location.hasPermission() == PermissionStatus.denied &&
        await location.requestPermission() != PermissionStatus.granted) return null;
    return await location.getLocation();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
}