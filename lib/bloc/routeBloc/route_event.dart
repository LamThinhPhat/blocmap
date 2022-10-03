part of 'route_bloc.dart';

class RouteEvent extends Equatable {
  final latLng.LatLng startPoint;
  const RouteEvent(this.startPoint);

  @override
  // TODO: implement props
  List<Object?> get props => [startPoint];

}
