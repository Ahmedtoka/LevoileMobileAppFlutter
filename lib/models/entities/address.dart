import 'package:country_pickers/utils/utils.dart';

import '../../common/constants.dart';

class Address {
  final String? id; // Shopify address ID
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? street;
  final String? apartment;
  final String? block;
  final String? city;
  final String? district;
  final String? ward;
  final String? state;
  final String? country;
  final String? countryId;
  final String? phoneNumber;
  final String? zipCode;
  final String? mapUrl;
  final String? latitude;
  final String? longitude;
  final String? company;
  final bool isShow;

  const Address({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.street,
    this.apartment,
    this.block,
    this.city,
    this.district,
    this.ward,
    this.state,
    this.country,
    this.countryId,
    this.phoneNumber,
    this.zipCode,
    this.mapUrl,
    this.latitude,
    this.longitude,
    this.isShow = true,
    this.company,
  });

  factory Address.fromJson(Map parsedJson) {
    return Address(
      firstName: parsedJson['first_name']?.toString(),
      lastName: parsedJson['last_name']?.toString(),
      street: parsedJson['address_1']?.toString(),
      block: parsedJson['address_2']?.toString(),
      apartment: parsedJson['company']?.toString(),
      city: parsedJson['city']?.toString(),
      state: parsedJson['state']?.toString(),
      country: parsedJson['country']?.toString(),
      email: parsedJson['email']?.toString(),
      phoneNumber: parsedJson['phone']?.toString(),
      zipCode: parsedJson['postcode']?.toString(),
      mapUrl: parsedJson['mapUrl']?.toString(),
      isShow: bool.tryParse('${parsedJson['isShow']}') ?? true,
    );
  }

  factory Address.fromOpencartJson(Map parsedJson) {
    return Address(
      firstName: parsedJson['firstname']?.toString(),
      lastName: parsedJson['lastname']?.toString(),
      apartment: parsedJson['company']?.toString(),
      street: parsedJson['address_1']?.toString(),
      block: parsedJson['address_2']?.toString(),
      city: parsedJson['city']?.toString(),
      state: parsedJson['zone_id']?.toString(),
      country: parsedJson['country_id']?.toString(),
      zipCode: parsedJson['postcode']?.toString(),
    );
  }

  factory Address.fromMagentoJson(Map<String, dynamic> parsedJson) {
    String? street;
    String? block;
    if (parsedJson['street'] != null) {
      var streets = List.from(parsedJson['street']);
      street = streets.isNotEmpty ? streets[0] : '';
      block = streets.length > 1 ? streets[1] : '';
    }

    return Address(
      firstName: parsedJson['firstname']?.toString(),
      lastName: parsedJson['lastname']?.toString(),
      street: street,
      block: block,
      city: parsedJson['city']?.toString(),
      state: parsedJson['region']?.toString(),
      country: parsedJson['country_id']?.toString(),
      email: parsedJson['email']?.toString(),
      phoneNumber: parsedJson['telephone']?.toString(),
      zipCode: parsedJson['postcode']?.toString(),
    );
  }

  factory Address.fromPrestaJson(Map<String, dynamic> parsedJson) {
    return Address(
      firstName: parsedJson['firstname']?.toString(),
      lastName: parsedJson['lastname']?.toString(),
      street: parsedJson['address1']?.toString(),
      block: parsedJson['address2']?.toString(),
      city: parsedJson['city']?.toString(),
      apartment: parsedJson['company']?.toString(),
      country: parsedJson['country']?.toString(),
      phoneNumber: parsedJson['phone']?.toString(),
      zipCode: parsedJson['postcode']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    var address = <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'address_1': street ?? '',
      'address_2': block ?? '',
      'company': apartment ?? '',
      'city': city,
      'state': state,
      'country': country,
      'phone': phoneNumber,
      'postcode': zipCode,
      'mapUrl': mapUrl,
      'isShow': isShow,
    };
    if (email != null && email!.isNotEmpty) {
      address['email'] = email;
    }
    return address;
  }

  Map<String, dynamic> toWCFMJson() {
    var address = toJson();
    if (street?.isNotEmpty ?? false) {
      address['wcfmmp_user_location'] = street;
    }
    if (latitude?.isNotEmpty ?? false) {
      address['wcfmmp_user_location_lat'] = latitude;
    }
    if (longitude?.isNotEmpty ?? false) {
      address['wcfmmp_user_location_lng'] = longitude;
    }
    return address;
  }

  factory Address.fromHaravanJson(Map parsedJson) {
    return Address(
      firstName: parsedJson['first_name']?.toString(),
      lastName: parsedJson['last_name']?.toString(),
      apartment: parsedJson['company']?.toString(),
      street: parsedJson['address1']?.toString(),
      block: parsedJson['address2']?.toString(),
      city: parsedJson['city']?.toString(),
      state: parsedJson['province']?.toString(),
      district: parsedJson['district']?.toString(),
      ward: parsedJson['ward']?.toString(),
      country: parsedJson['country']?.toString(),
      email: parsedJson['email']?.toString(),
      isShow: bool.tryParse('${parsedJson['isShow']}') ?? true,
      phoneNumber: parsedJson['phone']?.toString(),
      zipCode: parsedJson['zip']?.toString(),
    );
  }

  factory Address.fromLocalJson(Map json) {
    try {
      return Address(
        firstName: json['first_name']?.toString(),
        lastName: json['last_name']?.toString(),
        street: json['address_1']?.toString(),
        block: json['address_2']?.toString(),
        apartment: json['company']?.toString(),
        city: json['city']?.toString(),
        state: json['state']?.toString(),
        country: json['country']?.toString(),
        email: json['email']?.toString(),
        phoneNumber: json['phone']?.toString(),
        zipCode: json['postcode']?.toString(),
        mapUrl: json['mapUrl']?.toString(),
        isShow: bool.tryParse('${json['isShow']}') ?? true,
      );
    } catch (e) {
      printLog(e.toString());
      return const Address();
    }
  }

  Map<String, dynamic> toMagentoJson() {
    return {
      'address': {
        'region': state,
        'country_id': country,
        'region_id': state != null && int.tryParse(state!) != null
            ? int.parse(state!)
            : 0,
        'street': [
          street,
          '$apartment${(block?.isEmpty ?? true) ? '' : ' - $block'}',
        ],
        'postcode': zipCode,
        'city': city,
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'telephone': phoneNumber,
        'same_as_billing': 1,
      },
    };
  }

  Map<String, dynamic> toOpencartJson() {
    return {
      'zone_id': state,
      'country_id': countryId ?? country,
      'address_1': street ?? '',
      'address_2': block ?? '',
      'company': apartment ?? '',
      'postcode': zipCode,
      'city': city,
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'telephone': phoneNumber,
    };
  }

  bool isValid() {
    return (firstName?.isNotEmpty ?? false) &&
        (lastName?.isNotEmpty ?? false) &&
        (email?.isNotEmpty ?? false) &&
        (street?.isNotEmpty ?? false) &&
        (city?.isNotEmpty ?? false) &&
        (state?.isNotEmpty ?? false) &&
        (country?.isNotEmpty ?? false) &&
        (phoneNumber?.isNotEmpty ?? false);
  }

  Map<String, dynamic> toJsonEncodable() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'address_1': street ?? '',
      'address_2': block ?? '',
      'company': apartment ?? '',
      'city': city,
      'state': state,
      'country': country,
      'email': email,
      'phone': phoneNumber,
      'postcode': zipCode,
      'mapUrl': mapUrl,
      'isShow': isShow,
    };
  }

  factory Address.fromShopifyJson(Map json) {
    try {
      return Address(
        id: json['id']?.toString(),
        firstName: json['firstName']?.toString(),
        lastName: json['lastName']?.toString(),
        street: json['address1']?.toString(),
        apartment: json['address2']?.toString(),
        company: json['company']?.toString(),
        city: json['city']?.toString(),
        state: json['province']?.toString(),
        country: json['countryCodeV2']?.toString(),
        email: json['email']?.toString(),
        phoneNumber: json['phone']?.toString(),
        zipCode: json['zip']?.toString(),
      );
    } catch (e) {
      printLog(e.toString());
      return const Address();
    }
  }

  factory Address.fromShopifyCustomerJson(Map json) {
    try {
      return Address(
        id: json['id']?.toString(),
        firstName: json['firstName']?.toString(),
        lastName: json['lastName']?.toString(),
        street: json['address1']?.toString(),
        apartment: json['address2']?.toString(),
        company: json['company']?.toString(),
        city: json['city']?.toString(),
        state: json['province']?.toString(),
        country:
            json['countryCodeV2']?.toString() ?? json['country']?.toString(),
        email: json['email']?.toString(),
        phoneNumber: json['phoneNumber']?.toString(),
        zipCode: json['zip']?.toString(),
      );
    } catch (e) {
      printLog(e.toString());
      return const Address();
    }
  }

  Map<String, dynamic> toShopifyJson() {
    var lastState = state;
    if (state?.isEmpty ?? true) {
      lastState = city;
    }
    final address = {
      // if (id != null) 'id': id,
      'provinceCode': lastState,
      'countryCode': country,
      'address1': street,
      'address2': block,
      'company': apartment,
      'zip': zipCode,
      'city': city,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phoneNumber,
    };
    return address;
  }

  factory Address.fromOpencartOrderJson(Map json) {
    try {
      return Address(
        firstName: json['shipping_firstname']?.toString(),
        lastName: json['shipping_lastname']?.toString(),
        street: json['shipping_address_1']?.toString(),
        block: json['shipping_address_2']?.toString(),
        apartment: json['shipping_company']?.toString(),
        city: json['shipping_city']?.toString(),
        state: json['shipping_zone']?.toString(),
        country: json['shipping_country']?.toString(),
        email: json['email']?.toString(),
        phoneNumber: json['telephone']?.toString(),
        zipCode: json['shipping_postcode']?.toString(),
      );
    } catch (e) {
      printLog(e.toString());
      return const Address();
    }
  }

  factory Address.fromBigCommerceJson(Map json) {
    try {
      return Address(
        firstName: json['first_name']?.toString(),
        lastName: json['last_name']?.toString(),
        apartment: json['company']?.toString(),
        street: json['street_1']?.toString(),
        block: json['street_2']?.toString(),
        city: json['city']?.toString(),
        state: json['state']?.toString(),
        zipCode: json['zip']?.toString(),
        country: json['country']?.toString(),
        countryId: json['country_iso2']?.toString(),
        phoneNumber: json['phone']?.toString(),
        email: json['email']?.toString(),
      );
    } catch (e) {
      printLog(e.toString());
      return const Address();
    }
  }

  Address copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? street,
    String? apartment,
    String? block,
    String? city,
    String? district,
    String? ward,
    String? state,
    String? country,
    String? countryId,
    String? phoneNumber,
    String? zipCode,
    String? mapUrl,
    String? latitude,
    String? longitude,
    bool? isShow,
    String? company,
  }) {
    return Address(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      street: street ?? this.street,
      apartment: apartment ?? this.apartment,
      block: block ?? this.block,
      city: city ?? this.city,
      district: district ?? this.district,
      ward: ward ?? this.ward,
      state: state ?? this.state,
      country: country ?? this.country,
      countryId: countryId ?? this.countryId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      zipCode: zipCode ?? this.zipCode,
      mapUrl: mapUrl ?? this.mapUrl,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isShow: isShow ?? this.isShow,
      company: company ?? this.company,
    );
  }

  @override
  String toString() {
    var buffer = StringBuffer();
    buffer.writeln('First Name: $firstName');
    buffer.writeln('Last Name: $lastName');
    buffer.writeln('Email: $email');
    buffer.writeln('Street: $street');
    buffer.writeln('Apartment: $apartment');
    buffer.writeln('Block: $block');
    buffer.writeln('City: $city');
    buffer.writeln('State: $state');
    buffer.writeln('Country: $country');
    buffer.writeln('Phone Number: $phoneNumber');
    buffer.writeln('Zip Code: $zipCode');
    buffer.writeln('Map URL: $mapUrl');
    buffer.writeln('Is Show: $isShow');
    return buffer.toString();
  }

  String get fullName => [firstName ?? '', lastName ?? ''].join(' ').trim();

  String get fullAddress => [
    apartment ?? '',
    street ?? '',
    block ?? '',
    city ?? '',
    state ?? '',
    district ?? '',
    ward ?? '',
    zipCode ?? '',
    country ?? '',
  ].join(' ').trim();

  String get fullInfoAddress {
    final info = [
      street ?? '',
      block ?? '',
      apartment ?? '',
      ward ?? '',
      district ?? '',
      city ?? '',
      state ?? '',
      country != null ? _getCountryName(country) : '',
    ].map((s) => s.trim()).where((s) => s.isNotEmpty).join(', ');

    return zipCode?.isNotEmpty == true ? '$info - $zipCode' : info;
  }

  String _getCountryName(country) {
    try {
      return CountryPickerUtils.getCountryByIsoCode(country).name;
    } catch (err) {
      return country;
    }
  }

  bool isDiff(Address address) {
    return city != address.city ||
        street != address.street ||
        zipCode != address.zipCode ||
        state != address.state;
  }

  bool compareFullInfo(Address address) {
    return (id != address.id ||
            city != address.city ||
            street != address.street ||
            zipCode != address.zipCode ||
            state != address.state ||
            fullName != address.fullName ||
            phoneNumber != address.phoneNumber ||
            firstName != address.firstName ||
            lastName != address.lastName) ==
        false;
  }

  String toOrderHistoryAddress() {
    final address = [
      if (city?.isNotEmpty ?? false) city,
      if (country?.isNotEmpty ?? false) country,
    ];

    var fullInfo = [
      if (firstName?.isNotEmpty ?? false) firstName,
      if (address.isNotEmpty) address.join(', '),
    ];

    return fullInfo.isNotEmpty ? fullInfo.join(' | ') : '';
  }
}
