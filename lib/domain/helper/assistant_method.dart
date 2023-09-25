import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_car/domain/global.dart';
import 'package:shared_car/domain/helper/request_assistant.dart';
import 'package:shared_car/models/directions_model.dart';
import 'package:shared_car/models/user_model.dart';

import '../infoHandler/app_info.dart';

class AssistantMethod {
  static void readCurrentOnlineUserInfo() async {
    currentUser = firebaseAuth.currentUser;
    // CollectionReference users = FirebaseFirestore.instance.collection('users');

    DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users").child(currentUser!.uid);

    // users.doc(currentUser!.uid).get().then((value) {
    //   if (value.exists) {
    //     userModel = UserModel(id: value.id, lastName: value, name: value.name, rut: rut)
    //   }
    // })

    userRef.once().then((snap) {
      userModel = UserModel.fromSnapshot(snap.snapshot);
    });
  }

  static Future<String> searchAddressForGeographicCoordinates(Position position, context) async {
    String apiUrl = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.longitude},${position.longitude}&key=AIzaSyBTLUoynJ_9HGiuZQuwi9Rg0W6Dnr1C3rw";
    String humanReadableAddress = "";

    var requestResponse = await RequestAssistant.receiveRequest(apiUrl);

    if (requestResponse != "Ha ocurrido un error. Ha fallado la respuesta") {
      humanReadableAddress = requestResponse["results"][0]["formatted_address"];

      print(humanReadableAddress);

      Directions userPickUpAddress = Directions();
      userPickUpAddress.locationLatitude = position.latitude;
      userPickUpAddress.locationLongitude = position.longitude;
      userPickUpAddress.locationName = humanReadableAddress;

      Provider.of<AppInfo>(context, listen: false).updatePickUpLocationAddress(userPickUpAddress);
    }

    return humanReadableAddress;
  }
}