import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:provider/provider.dart';
import 'package:shared_car/domain/global.dart';
import 'package:shared_car/domain/helper/assistant_method.dart';
import 'package:shared_car/domain/infoHandler/app_info.dart';
import 'package:shared_car/models/directions_model.dart';
import 'package:shared_car/presentation/screens/screens.dart';

class MainScreen extends StatefulWidget {
  static const String name = 'main_screen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  LatLng? pickLocation;
  loc.Location location = loc.Location();
  String? _address;

  final Completer<GoogleMapController> _controllerGoogleMap =
      Completer<GoogleMapController>();
  GoogleMapController? newGoogleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  double searchLocationContainerHeight = 220;
  double waitingResponseFromDriverContainerHeight = 0;
  double assignedDriverInfoContainerHeight = 0;

  Position? userCurrentPosition;
  var geoLocation = Geolocator();

  LocationPermission? _locationPermission;
  double bottomPaddingOfMap = 0;

  List<LatLng> pLineCoordinatedList = [];
  Set<Polyline> polylineSet = {};

  Set<Marker> markersSet = {};
  Set<Circle> circulesSet = {};

  String userName = "";
  String userEmail = "";

  bool openNavigationDrawer = true;

  bool activeNearbyDriverKeysLoaded = false;

  BitmapDescriptor? activeNearbyIcon;

  locateUserPosition() async {
    Position cPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userCurrentPosition = cPosition;

    LatLng latLngPosition =
        LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude);
    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 15);

    newGoogleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String humanReadableAddress =
        await AssistantMethod.searchAddressForGeographicCoordinates(
            userCurrentPosition!, context);

    print("This is our address" + humanReadableAddress);

    userName = userModel!.name!;
    userEmail = userModel!.email!;
  }

  getAddressFromLatLng() async {
    // GeoCode geoCode = GeoCode();
      List<dynamic> locations = await placemarkFromCoordinates(pickLocation!.latitude, pickLocation!.longitude);
      print(locations[0]);
    try {
      // Address address = await geoCode.reverseGeocoding(
      //     latitude: pickLocation!.latitude, longitude: pickLocation!.longitude);
      setState(() {
        // Directions userPickUpAddress = Directions();
        // userPickUpAddress.locationLatitude = pickLocation!.latitude;
        // userPickUpAddress.locationLongitude = pickLocation!.longitude;
        // userPickUpAddress.locationName = locations[0]['Street'];
        // userPickUpAddress.locationName =
        //     "${address.streetAddress}, ${address.streetNumber}, ${address.city}";
        // _address = "${address.streetAddress}, ${address.streetNumber}, ${address.city}";

        print(_address);
      });
    } catch (error) {
      print(error);
    }
  }

  checkIfLocationPermissionAllowed() async {
    _locationPermission = await Geolocator.requestPermission();

    if (_locationPermission == LocationPermission.denied) {
      _locationPermission = await Geolocator.requestPermission();
    }
  }

  @override
  void initState() {
    super.initState();
    checkIfLocationPermissionAllowed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              initialCameraPosition: _kGooglePlex,
              polylines: polylineSet,
              markers: markersSet,
              circles: circulesSet,
              onMapCreated: (GoogleMapController controller) {
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;

                setState(() {});

                locateUserPosition();
              },
              onCameraMove: (CameraPosition? position) {
                if (pickLocation != position!.target) {
                  setState(() {
                    pickLocation = position.target;
                  });
                }
              },
              onCameraIdle: () {
                getAddressFromLatLng();
              },
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: Image.asset(
                  "images/pick.png",
                  height: 45,
                  width: 45,
                ),
              ),
            ),
            Positioned(
                top: 40,
                right: 20,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    Provider.of<AppInfo>(context).userPickUpLocation != null
                        ? (Provider.of<AppInfo>(context)
                                    .userPickUpLocation!
                                    .locationName!)
                                .substring(0, 11) +
                            "..."
                        : "No hay direccion asignada",
                    // child: Text(_address ?? "Mueve donde quiere tomar el auto",
                    overflow: TextOverflow.visible, softWrap: true,
                  ),
                ))
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, snapshot) {
    //     if(snapshot.hasData) {
    //       return const UserMainPageScreen();
    //     } else {
    //       return const AuthScreen();
    //     }
    //   },),
    // );
  }
}
