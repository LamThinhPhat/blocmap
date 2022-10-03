part of 'route_bloc.dart';


abstract class RouteState extends Equatable {
  const RouteState();
  List<Object> get props => [];
}

class RouteInitial extends RouteState { }

class RouteFailure extends RouteState { }

class Routesuccess extends RouteState {
  final List<latLng.LatLng> routeToDraw;
  const Routesuccess ({required this.routeToDraw});
  @override
  List<Object> get props => [routeToDraw];

  Routesuccess cloneWith({required List<latLng.LatLng> routeToDraw}) {
    return Routesuccess(routeToDraw: routeToDraw);
  }
}
