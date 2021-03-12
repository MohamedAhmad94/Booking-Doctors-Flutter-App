import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class SearchMap extends StatefulWidget {
  @override
  _SearchMapState createState() => _SearchMapState();
}

class _SearchMapState extends State<SearchMap> {
  bool isMapLoading = true;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    checkMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black, size: 20.0),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: field(),
      ),
      body: Container(
        child: FutureBuilder(
          future: checkMap(),
          builder: (BuildContext context, AsyncSnapshot shot) {
            return Center(
              child: shot.data,
            );
          },
        ),
      ),
    );
  }

  checkMap() async {
    setState(() {
      isMapLoading = true;
    });
    //LocationPermission _permission = await Geolocator.checkPermission();
    bool _locationService = await Geolocator.isLocationServiceEnabled();

    if (_locationService == false) {
      setState(() {
        isMapLoading = false;
      });
      return Text("Please enable your location service");
    } else if (searchController.text.isNotEmpty) {
      List<Location> locations =
          await locationFromAddress(searchController.text);
      setState(() {
        isMapLoading = false;
      });
      return map(locations[0].latitude, locations[0].longitude);
    } else {
      setState(() {
        isMapLoading = false;
      });
      return map(30.004, 31.2357);
    }
  }

  map(double? lat, double? long) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        zoom: 15,
        target: LatLng(lat!, long!),
      ),
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      trafficEnabled: true,
    );
  }

  field() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
          ),
          labelText: "Search By Location",
          labelStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.location_city, color: Colors.grey),
        ),
        textInputAction: TextInputAction.search,
        controller: searchController,
        onSubmitted: (value) {
          checkMap();
        },
      ),
    );
  }
}
