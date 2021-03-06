import 'dart:async';
import 'dart:convert';
import 'package:virus_gps_system/models/user_location.dart';
import 'package:http/http.dart' as http;

// I don't know what type to send for.
Future<UserLocation> createGPS(String latitude, String longitude) async {
  final http.Response response = await http.post(
    //need to edit routes and functions.
    'https://jsonplaceholder.typicode.com/UserLocations',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'latitude': latitude.toString(),
      'longitude': longitude.toString()
    }),
  );

  if (response.statusCode == 201) {
    return UserLocation.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create UserLocation.');
  }
}
