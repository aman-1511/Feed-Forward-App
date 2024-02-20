// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart' as loc;

// class MyMap extends StatefulWidget {
//   final String user_id;
//   MyMap(this.user_id);
//   @override
//   _MyMapState createState() => _MyMapState();
// }

// class _MyMapState extends State<MyMap> {
//   final loc.Location location = loc.Location();
//   late GoogleMapController _controller;
//   bool _added = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('location').snapshots(),
//       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (_added) {
//           mymap(snapshot);
//         }
//         if (!snapshot.hasData) {
//           return Center(child: CircularProgressIndicator());
//         }
//         return GoogleMap(
//           mapType: MapType.normal,
//           markers: {
//             Marker(
//                 position: LatLng(
//                   snapshot.data!.docs.singleWhere(
//                       (element) => element.id == widget.user_id)['latitude'],
//                   snapshot.data!.docs.singleWhere(
//                       (element) => element.id == widget.user_id)['longitude'],
//                 ),
//                 markerId: MarkerId('id'),
//                 icon: BitmapDescriptor.defaultMarkerWithHue(
//                     BitmapDescriptor.hueMagenta)),
//           },
//           initialCameraPosition: CameraPosition(
//               target: LatLng(
//                 snapshot.data!.docs.singleWhere(
//                     (element) => element.id == widget.user_id)['latitude'],
//                 snapshot.data!.docs.singleWhere(
//                     (element) => element.id == widget.user_id)['longitude'],
//               ),
//               zoom: 14.47),
//           onMapCreated: (GoogleMapController controller) async {
//             setState(() {
//               _controller = controller;
//               _added = true;
//             });
//           },
//         );
//       },
//     ));
//   }

//   Future<void> mymap(AsyncSnapshot<QuerySnapshot> snapshot) async {
//     await _controller
//         .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//             target: LatLng(
//               snapshot.data!.docs.singleWhere(
//                   (element) => element.id == widget.user_id)['latitude'],
//               snapshot.data!.docs.singleWhere(
//                   (element) => element.id == widget.user_id)['longitude'],
//             ),
//             zoom: 14.47)));
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_donation/layout/screen_layout.dart';
import 'package:food_donation/screen1/home_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../layout/screen_layout.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  Set<Marker> _markers = {};
  CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(20.5937, 78.9629), // India
    zoom: 5,
  );

  void _onMapTap(LatLng position) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          onTap: () => _onMarkerTap(position),
          infoWindow: const InfoWindow(
            title: 'Marker Title',
            snippet: 'Marker Snippet',
          ),
        ),
      );
    });
  }

  void _onMarkerTap(LatLng position) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Marker Info'),
        content: Column(
          children: [
            Text('Latitude: ${position.latitude}'),
            Text('Longitude: ${position.longitude}'),
            // Add additional info from marker data
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(120, 0, 0, 0),
              blurRadius: 20,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Color(0xffFFB200),
              // Color(0xffFEB139),
              Color(0xffFFDE00),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        )),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const ScreenLayout(),
              ),
            );
          },
        ),
        title: const Text(
          'Google Map Example',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        markers: _markers,
        onTap: _onMapTap,
        initialCameraPosition: _initialCameraPosition,
      ),
    );
  }
}
