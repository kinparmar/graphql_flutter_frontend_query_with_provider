import 'package:flutter/foundation.dart';
import '../../schemas/get_houses_schema.dart';
import '../../schemas/urlEndpoints.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GetHousesProviders extends ChangeNotifier {
  bool _status = false;

  String _response = '';

  dynamic _list = [];

  bool get getStatus => _status;

  String get getResponse => _response;

  final EndPoint _point = EndPoint();

  ///Add task method
  void getHouses(bool isLocal) async {
    ValueNotifier<GraphQLClient> _client = _point.getClient();

    QueryResult result = await _client.value.query(QueryOptions(
        document: gql(GetHousesSchema.getHouses),
        fetchPolicy: isLocal == true ? null : FetchPolicy.networkOnly
        ));

    if (result.hasException) {
      print(result.exception);
      _status = false;
      if (result.exception!.graphqlErrors.isEmpty) {
        _response = "Internet is not found";
      } else {
        _response = result.exception!.graphqlErrors[0].message.toString();
      }
      notifyListeners();
    } else {
      print(result.data);
      _status = false;
      _list = result.data;
      notifyListeners();
    }
  }

  dynamic getResponseData() {
    if (_list.isNotEmpty) {
      final data = _list;

      print(data['allProperties']);

      return data['allProperties'] ?? {};
    } else {
      return {};
    }
  }

  void clear() {
    _response = '';
    notifyListeners();
  }
}
