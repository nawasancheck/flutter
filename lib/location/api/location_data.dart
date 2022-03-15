import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class LocationData extends StatefulWidget {
  const LocationData({Key? key}) : super(key: key);

  @override
  _LocationDataState createState() => _LocationDataState();
}

class _LocationDataState extends State<LocationData> {
  Future<List> fetchData() async {
    Map<String, String> headerss = {
      "X-NCP-APIGW-API-KEY-ID": "ayz7r0vskw", // 개인 클라이언트 아이디
      "X-NCP-APIGW-API-KEY": "bm3QbwR988mjKNY6LbYT3gB37asxoeyzgC4FCpS8" // 개인 시크릿 키
    };

    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    String lat = position.latitude.toString();
    String lon = position.longitude.toString();
    print(position);

    Response response = await get(
        Uri.parse(
            "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?request=coordsToaddr&coords=-122.0840352,37.4220094&sourcecrs=epsg:4326&output=json"),
        headers: headerss);

    String jsonData = response.body;

    print(jsonData);
    var locationGu = jsonDecode(jsonData)["results"][1]['region']['area2']['name'];
    var locationSi = jsonDecode(jsonData)["results"][1]['region']['area1']['name'];

    List<String> location = [locationSi, locationGu];
    print(location);
    return location;
  }

  void getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
    } catch (e) {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        RaisedButton(
            onPressed: () {
              fetchData();
            },
            child: Text('Get my location')),
      ]),
    );
  }
}
