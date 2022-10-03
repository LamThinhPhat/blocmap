
import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart' as latLng;

import '../models//lineString.dart';

Future<List<latLng.LatLng>> getRoute(double startLng, double startLat) async {
  final String keymap = "5b3ce3597851110001cf62488405514894ed4132af5ce11377c3a573";
  final String url = 'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$keymap';// Change it if you want or make it variable
  try
  {
    var options = BaseOptions(
      baseUrl: '$url&start=$startLng,$startLat&end=106.700000,10.762622',
    );
    Dio dioTest = Dio(options);
    var response = await dioTest.get(''); // or await Dio().get('$url&start=$startLng,$startLat&end=106.700000,10.762622');
    if (response.statusCode == 200)
    {
      List<latLng.LatLng> polypoint = [];
      LineString ls =
      LineString(response.data['features'][0]['geometry']['coordinates']);

      for (int i = 0; i < ls.lineString.length; i++) {
        polypoint.add(latLng.LatLng(ls.lineString[i][1], ls.lineString[i][0]));
      }
      return polypoint;
    }
    else
    {
      return [];
    }
  }
  catch(exeption)
  {
    print(exeption.toString());
    return [];
  }
}