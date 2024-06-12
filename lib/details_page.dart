import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart' as gmaps;
import 'dart:ui' as ui;

class DetailsPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final double price;
  final String location;
  final String openingTime;

  DetailsPage({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.price,
    required this.location,
    required this.openingTime,
  });

  @override
  Widget build(BuildContext context) {
    // Register the map view.
    // Ensure this code is executed before build().
    // This is to create a unique identifier for the HtmlElementView widget.
    String htmlId = "7cbd0bc2-d01c-44d4-b6dd-66d022e3659c";

    // Register the view factory with the unique ID.
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final elem = DivElement()
        ..id = 'map-canvas'
        ..style.width = '100%'
        ..style.height = '100%';

      // Create a map centered on the initial location (this will be updated).
      final mapOptions = gmaps.MapOptions()
        ..zoom = 14;

      final map = gmaps.GMap(elem, mapOptions);

      // Create a Geocoder instance.
      final geocoder = gmaps.Geocoder();

      // Geocode the location to get the coordinates.
      geocoder.geocode(gmaps.GeocoderRequest()..address = location, (results, status) {
        if (status == gmaps.GeocoderStatus.OK && results != null && results.isNotEmpty) {
          final result = results[0];
          if (result != null && result.geometry != null && result.geometry!.location != null) {
            final latLng = result.geometry!.location;
            map.center = latLng;
            // Add a marker at the location.
            gmaps.Marker(gmaps.MarkerOptions()
              ..position = latLng
              ..map = map
              ..title = title);
          }
        }
      });

      return elem;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$$price per person',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        location,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        'Open: $openingTime',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 200,
                    child: HtmlElementView(viewType: htmlId),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle booking action
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Center(
                      child: Text(
                        'BOOK NOW',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
