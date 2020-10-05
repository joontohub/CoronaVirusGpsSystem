import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virus_gps_system/models/user_location.dart';
import 'package:virus_gps_system/services/location_service.dart';
import 'package:virus_gps_system/services/http_GPS.dart';

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
  Future<UserLocation> _futureUserLocation;
  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return MaterialApp(
      title: 'Create GPS Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create GPS Data'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureUserLocation == null)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'Location : Latitude: ${userLocation.latitude}, Longitude: ${userLocation.longitude}'),
                    RaisedButton(
                      child: Text('Create Data'),
                      onPressed: () {
                        setState(() {
                          _futureUserLocation = createGPS(
                              userLocation.latitude.toString(),
                              userLocation.longitude.toString());
                        });
                      },
                    ),
                  ],
                )
              : FutureBuilder<UserLocation>(
                  future: _futureUserLocation,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                          'this is result -> id is : ${snapshot.data.id.toString()} latitude is : ${snapshot.data.latitude.toString()} longitude is : ${snapshot.data.longitude.toString()}');
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                  },
                ),
        ),
      ),
    );
  }
}
