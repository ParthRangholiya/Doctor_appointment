import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  final bool zoomGesturesEnabled;
  final bool tiltGesturesEnabled;
  final bool zoomControlsEnabled;
  final double zoom;
  const GoogleMapWidget({
    super.key,
    required this.zoomGesturesEnabled,
    required this.tiltGesturesEnabled,
    required this.zoomControlsEnabled,
    required this.zoom,
  });

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  GoogleMapController? googleMapController;

  // Initial camera position
  final CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(21.2408, 72.8806),
    zoom: 13,
  );

  // Function to handle map creation
  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  @override
  void dispose() {
    googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GoogleMap(
      gestureRecognizers: {
        Factory<OneSequenceGestureRecognizer>(
          () => EagerGestureRecognizer(),
        ),
      },
      initialCameraPosition: CameraPosition(
        target: const LatLng(21.2408, 72.8806),
        zoom: widget.zoom,
      ),
      padding: EdgeInsets.only(bottom: width * 0.4),
      mapType: MapType.normal,
      myLocationEnabled: false,
      zoomGesturesEnabled: widget.zoomGesturesEnabled,
      tiltGesturesEnabled: widget.tiltGesturesEnabled,
      zoomControlsEnabled: widget.zoomControlsEnabled,
      onMapCreated: onMapCreated,
    );
  }
}
