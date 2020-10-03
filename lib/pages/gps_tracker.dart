import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virus_gps_system/models/user_location.dart';
import 'package:virus_gps_system/services/location_service.dart';

class GpsTracker extends StatefulWidget {
  @override
  _GpsTrackerState createState() => _GpsTrackerState();
}

class _GpsTrackerState extends State<GpsTracker> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
        create: (context) => LocationService().locationStream,
        child: MaterialApp(title: "Corona GPS", home: GPSView()));
  }
}

class GPSView extends StatefulWidget {
  @override
  _GPSViewState createState() => _GPSViewState();
}

class _GPSViewState extends State<GPSView> {
  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Center(
      child: Text(
          'Location : Latitude: ${userLocation.latitude}, Longitude: ${userLocation.longitude}'),
    );
  }
}
