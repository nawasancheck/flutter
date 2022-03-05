import 'package:geolocator/geolocator.dart';

class MyLocation {

  double latitude2 = 0;
  double longitude2 = 0;

  Future<void> getMyCurrentLocation() async{
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;

    } catch(e) {
      print('There was a problem with the internet connection.');
    }
  }

}