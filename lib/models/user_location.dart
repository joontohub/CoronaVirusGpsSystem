import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation({this.latitude, this.longitude});
}

class DataInfo {
  final double dataLatitude;
  final double dataLongitude;
  DataInfo({this.dataLatitude, this.dataLongitude});

  DataInfo.fromJson(
      Map<String, dynamic> json, this.dataLatitude, this.dataLongitude) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.dataLatitude;
    data['longitude'] = this.dataLongitude;

    return data;
  }
}
