
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String endpointUrl =
    "http://localhost:4000/";
class EndPoint {

  ValueNotifier<GraphQLClient> getClient(){
    ValueNotifier<GraphQLClient> _client = ValueNotifier(
      GraphQLClient(
        link: HttpLink(endpointUrl),

        cache: GraphQLCache(store: HiveStore()),
      )
    );

    return _client;
  }
}