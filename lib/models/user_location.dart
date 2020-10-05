import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class UserLocation {
  final int id;
  final double latitude;
  final double longitude;

  UserLocation({this.id, this.latitude, this.longitude});

  factory UserLocation.fromJson(Map<String, dynamic> json) {
    return UserLocation(
        id: json['id'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }
}

class DataInfo {
  final double dataLatitude;
  final double dataLongitude;
  DataInfo({this.dataLatitude, this.dataLongitude});

  DataInfo.fromJson(
      Map<String, dynamic> json, this.dataLatitude, this.dataLongitude);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.dataLatitude;
    data['longitude'] = this.dataLongitude;

    return data;
  }
}
