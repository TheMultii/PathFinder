/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:pathfinder_client/src/protocol/route.dart' as _i3;
import 'dart:io' as _i4;
import 'protocol.dart' as _i5;

class _EndpointPathfinder extends _i1.EndpointRef {
  _EndpointPathfinder(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'pathfinder';

  _i2.Future<List<_i3.PathfinderRoute>> getAvailablRoutes() =>
      caller.callServerEndpoint<List<_i3.PathfinderRoute>>(
        'pathfinder',
        'getAvailablRoutes',
        {},
      );

  _i2.Future<void> addSampleRoute() => caller.callServerEndpoint<void>(
        'pathfinder',
        'addSampleRoute',
        {},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i4.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i5.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    pathfinder = _EndpointPathfinder(this);
  }

  late final _EndpointPathfinder pathfinder;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup =>
      {'pathfinder': pathfinder};
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
