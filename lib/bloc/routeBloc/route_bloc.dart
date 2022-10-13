import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocmap/services/routeService.dart';
import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart' as latLng;
part 'route_event.dart';
part 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  RouteBloc() :super(RouteInitial()){
    on<RouteEvent>((event, emit) async {
      try
      {
        if (state is RouteInitial)
        {
          final routeFromApi = await getRoute(event.startPoint.longitude, event.startPoint.latitude);
          if (routeFromApi.isEmpty)
          {
            emit(RouteFailure());

          }
          else
          {
            emit(Routesuccess(routeToDraw: routeFromApi));
          }
        }
        else if (state is Routesuccess)
        {
          emit(RouteInitial());
          final routeFromApi = await getRoute(event.startPoint.longitude, event.startPoint.latitude);
          print(routeFromApi);
          if (routeFromApi.isEmpty)
          {
            emit(RouteFailure());

          }
          else
          {
            emit(Routesuccess(routeToDraw: routeFromApi));
          }
        }
      }
      catch(exeption)
      {
        emit(RouteFailure());
      }
    });
  }
}
