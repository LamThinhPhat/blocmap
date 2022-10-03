
import 'package:blocmap/bloc/routeBloc/route_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    RouteBloc _routeBloc = BlocProvider.of(context);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<RouteBloc, RouteState>(
          bloc: _routeBloc,
          builder: (context, state) {
            return Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                      onTap: (tapPosion, newPosition) {
                        print(newPosition.latitude.toString() + " " + newPosition.longitude.toString());
                        _routeBloc.add(RouteEvent(newPosition));
                      },
                      center:latLng.LatLng(10.762622, 106.660172),
                      zoom: 15.0,
                      interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                    PolylineLayerOptions(
                      polylines:[
                        Polyline(
                          points: state is Routesuccess ? state.routeToDraw : [],
                          strokeWidth: 4,
                          gradientColors: [
                            Color(0xffE40203),
                            Color(0xffFEED00),
                            Color(0xff007E2D),
                          ],
                        )
                      ]
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

