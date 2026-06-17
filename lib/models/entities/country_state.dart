class CountryState {
  String? id;
  String? code;
  String? name;
  CountryState({this.id, this.code, this.name});

  CountryState.fromConfig(dynamic parsedJson) {
    if (parsedJson is Map) {
      id = parsedJson['code']?.toString();
      code = parsedJson['code']?.toString();
      name = parsedJson['name']?.toString();
    }
    if (parsedJson is String) {
      id = parsedJson;
      code = parsedJson;
      name = parsedJson;
    }
  }

  CountryState.fromMagentoJson(Map parsedJson) {
    id = parsedJson['id']?.toString();
    code = parsedJson['code']?.toString();
    name = parsedJson['name']?.toString();
  }

  CountryState.fromHaravan(Map parsedJson) {
    id = parsedJson['id']?.toString();
    code = parsedJson['code']?.toString();
    name = parsedJson['name']?.toString();
  }

  CountryState.fromOpencartJson(Map parsedJson) {
    id = parsedJson['zone_id']?.toString();
    code = parsedJson['code']?.toString();
    name = parsedJson['name']?.toString();
  }

  CountryState.fromPrestashop(Map parsedJson) {
    id = parsedJson['id']?.toString();
    name = parsedJson['name']?.toString();
    code = parsedJson['iso_code']?.toString();
  }

  CountryState.fromWooJson(Map parsedJson) {
    id = parsedJson['code']?.toString();
    code = parsedJson['code']?.toString();
    name = parsedJson['name']?.toString();
  }

  CountryState.fromBigCommerceJson(Map parsedJson) {
    id = parsedJson['code']?.toString();
    code = parsedJson['code']?.toString();
    name = parsedJson['name']?.toString();
  }
}
