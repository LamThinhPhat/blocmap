import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocmap/services/routeService.dart';
import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart' as latLng;
part 'route_event.dart';
part 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  RouteBloc() :super(RouteInitial());

  @override
  Stream<RouteState> mapEventToState(RouteEvent event) async* {
    if (event is RouteEvent)
      {
        try
        {
            if (state is RouteInitial)
            {
              final routeFromApi = await getRoute(event.startPoint.longitude, event.startPoint.latitude);
              if (routeFromApi.isEmpty)
                {
                  yield RouteFailure();

                }
              else
                {
                  yield Routesuccess(routeToDraw: routeFromApi);
                }
            }
            else if (state is Routesuccess)
            {
              yield RouteInitial();
              final routeFromApi = await getRoute(event.startPoint.longitude, event.startPoint.latitude);
              print(routeFromApi);
              if (routeFromApi.isEmpty)
              {
                yield RouteFailure();

              }
              else
              {
                yield Routesuccess(routeToDraw: routeFromApi);
              }
            }
        }
        catch(exeption)
        {
          yield RouteFailure();
        }
      }
  }
}
