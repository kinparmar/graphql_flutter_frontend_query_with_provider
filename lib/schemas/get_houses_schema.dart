
class GetHousesSchema {
  static String getHouses = r'''
query AllProperties {
  allProperties {
    address
    description
    bathRooms
    bedRooms
  }
}
''';
}