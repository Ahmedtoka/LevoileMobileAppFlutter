import 'package:html_unescape/html_unescape.dart';
import 'package:inspireui/inspireui.dart';
import 'package:intl/intl.dart';
import 'package:quiver/strings.dart';

import '../../core/helpers/helpers.dart';
import '../vacation_settings.dart';
import 'store_hour.dart';

class Store {
  // Support both Dokan and WCFM
  int? id;
  String? name;
  String? email;
  bool showEmail = true;
  String? chatEmail;
  double? rating;
  String? reviewCount;
  String? image;
  String? address;
  String? banner;
  String? phone;
  String? website;
  double? lat;
  double? long;
  Map<String, String>? socials;
  StoreHour? storeHour;
  String? link;

  // WCFM parses from API, Dokan uses defaults
  bool showAddress = true;
  bool showPhone = true;
  bool showDescription = true;

  // Support only WCFM
  double? minOrderAmount;
  String? description;
  bool enableChat = false;
  VacationSettings? vacationSettings;

  // Support only Dokan
  bool? isFeatured;
  String? storeOpenNote;
  String? storeCloseNote;

  Store.fromDokanJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];

    if (parsedJson['first_name'] != null && parsedJson['last_name'] != null) {
      name = '${parsedJson["first_name"]} ${parsedJson["last_name"]}';
    }

    link = parsedJson['shop_url'];

    if (isNotEmpty(parsedJson['name'])) {
      name = parsedJson['name'];
    }
    if (isNotEmpty(parsedJson['shop_name'])) {
      name = parsedJson['shop_name'];
    }
    if (isNotEmpty(parsedJson['store_name'])) {
      name = parsedJson['store_name'];
    }
    if (name != null) {
      name = HtmlUnescape().convert(name!);
    }

    email = parsedJson['email'] ?? '';
    chatEmail = email;
    showEmail = parsedJson['show_email'] != null
        ? parsedJson['show_email'] == true
        : true;
    rating = 0.0;
    if (parsedJson['rating'] != null) {
      if (parsedJson['rating']['rating'] != null &&
          double.tryParse('${parsedJson['rating']['rating']}') != null) {
        rating = double.parse('${parsedJson['rating']['rating']}');
      }
    }
    reviewCount = parsedJson['rating']?['count']?.toString();

    String? stringLocation = '';
    if (parsedJson['location'] is String) {
      stringLocation = parsedJson['location'];
    } else if (parsedJson['location'] is List) {
      stringLocation = parsedJson['location'].join(',');
    }

    if (stringLocation?.isNotEmpty ?? false) {
      final arrLocation = stringLocation!.split(',');
      lat = arrLocation[0] != '' ? double.parse(arrLocation[0]) : 0;
      long = arrLocation[1] != '' ? double.parse(arrLocation[1]) : 0;
    }

    image = _parseImage(parsedJson['gravatar']);

    if (parsedJson['address'] is Map) {
      address = _formatDokanAddress(parsedJson['address']);
    }

    banner = _parseImage(parsedJson['banner']);
    phone = parsedJson['phone'];
    isFeatured = parsedJson['featured'] ?? false;
    showDescription = false;

    final dynamic storeOpenCloseRaw = parsedJson['store_open_close'];
    final storeOpenClose = storeOpenCloseRaw is Map ? storeOpenCloseRaw : null;
    final time = storeOpenClose?['time'];

    if (storeOpenClose?['enabled'] == true &&
        time != null &&
        time is Map &&
        time.isNotEmpty) {
      storeHour = StoreHour.fromDokan(time);
    }

    // Full social information is retrieved from Dokan settings
    // in Admin -> Edit Profile (user account settings).
    // Note: The "My Profile" page (domain/my-profile/) may not include social data.
    final socialJson = parsedJson['social'];
    if (socialJson is Map) {
      final safeSocials = <String, String>{};
      const socialKeyMap = {'fb': 'facebook', 'ggplus': 'googleplus'};

      for (final MapEntry(:key, :value) in socialJson.entries) {
        if (key == null || value == null) continue;

        final keyStr = key.toString().trim();
        final valueStr = value.toString().trim();

        if (keyStr.isEmpty || valueStr.isEmpty) continue;

        safeSocials[socialKeyMap[keyStr] ?? keyStr] = valueStr;
      }

      if (safeSocials.isNotEmpty) {
        socials = safeSocials;
      }
    }
    storeOpenNote = storeOpenClose?['open_notice']?.toString();
    storeCloseNote = storeOpenClose?['close_notice']?.toString();
  }

  Store.fromWCFMJson(Map<String, dynamic> parsedJson) {
    id = int.parse("${parsedJson["vendor_id"]}");

    if (isNotEmpty(parsedJson['vendor_shop_name'])) {
      name = parsedJson['vendor_shop_name'];
    }
    if (name != null) {
      name = HtmlUnescape().convert(name!);
    }

    email = parsedJson['vendor_email'];
    link = parsedJson['shop_url'];
    chatEmail = parsedJson['chat_email'] ?? email;
    rating = double.parse(
      (parsedJson['store_rating'] != null &&
              parsedJson['store_rating'].toString().isNotEmpty)
          ? parsedJson['store_rating'].toString()
          : '0.0',
    );

    reviewCount = parsedJson['vendor_reviews_count']?.toString();

    address = _formatWCFMAddress(parsedJson['vendor_address']);

    showDescription = !(parsedJson['store_hide_description'] != 'no');
    showAddress = !(parsedJson['store_hide_address'] != 'no');
    showEmail = !(parsedJson['store_hide_email'] != 'no');
    showPhone = !(parsedJson['store_hide_phone'] != 'no');

    if (parsedJson['vendor_description'] != null) {
      description = parsedJson['vendor_description'] is String
          ? parsedJson['vendor_description']
          : null;
    }
    if (Bidi.stripHtmlIfNeeded(description ?? '').trim().isEmpty) {
      showDescription = false;
    }

    final settings = parsedJson['settings'];
    if (settings is Map) {
      image = _parseImage(settings['gravatar']);
      if (isBlank(image)) {
        image = _parseImage(parsedJson['vendor_shop_logo']);
      }

      banner = _parseImage(settings['mobile_banner']);
      if (isBlank(banner)) {
        banner = _parseImage(settings['banner']);
      }
      if (isBlank(banner)) {
        banner = _parseImage(parsedJson['mobile_banner']);
      }
      if (isBlank(banner)) {
        banner = _parseImage(parsedJson['vendor_banner']);
      }
      if (isBlank(banner)) {
        banner = _parseImage(parsedJson['vendor_list_banner']);
      }

      lat = FluxUiHelper.formatDouble(settings['store_lat']);
      long = FluxUiHelper.formatDouble(settings['store_lng']);
      var geolocation = settings['geolocation'];
      if (geolocation is Map) {
        lat ??= FluxUiHelper.formatDouble(geolocation['store_lat']);
        long ??= FluxUiHelper.formatDouble(geolocation['store_lng']);
      }

      phone = '';
      if (settings['phone'] is List) {
        if (settings['phone'].isNotEmpty) {
          phone = settings['phone'][0];
        }
      }
      if (settings['phone'] is String) {
        phone = settings['phone'];
      }

      // Social information is retrieved from
      // Store Manager -> Profile -> Social (domain/store-manager/profile/)
      final socialJson = settings['social'];
      if (socialJson is Map) {
        final safeSocials = <String, String>{};
        const socialKeyMap = {'fb': 'facebook', 'ggplus': 'googleplus'};

        for (final MapEntry(:key, :value) in socialJson.entries) {
          if (key == null || value == null) continue;

          final keyStr = key.toString().trim();
          final valueStr = value.toString().trim();

          if (keyStr.isEmpty || valueStr.isEmpty) continue;

          safeSocials[socialKeyMap[keyStr] ?? keyStr] = valueStr;
        }

        if (safeSocials.isNotEmpty) {
          socials = safeSocials;
        }
      }

      if (settings['wcfm_store_hours'] is Map) {
        storeHour = StoreHour.fromWCFM(settings['wcfm_store_hours']);
      }
      vacationSettings = VacationSettings.fromJson(settings);
    } else {
      banner = _parseImage(parsedJson['mobile_banner']);
      if (isBlank(banner)) {
        banner = _parseImage(parsedJson['vendor_shop_logo']);
      }
      if (isBlank(banner)) {
        banner = _parseImage(parsedJson['vendor_banner']);
      }
      if (isBlank(banner)) {
        banner = _parseImage(parsedJson['vendor_list_banner']);
      }
    }
    minOrderAmount = double.tryParse('${parsedJson['min_order_amt']}');
    enableChat = bool.tryParse('${parsedJson['enable_chat']}') ?? false;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'rating': rating,
      'image': image,
      'address': address,
      'banner': banner,
      'phone': phone,
      'website': website,
    };
  }

  Store.fromLocalJson(Map json) {
    try {
      id = int.tryParse(json['id'].toString());
      name = json['name'];
      email = json['email'];
      rating = double.tryParse(json['rating'].toString());
      image = json['image'];
      address = json['address'];
      banner = json['banner'];
      phone = json['phone'];
      website = json['website'];
    } catch (e, trace) {
      printLog(e.toString());
      printLog(trace.toString());
    }
  }
}

extension on Store {
  // Format address from Dokan
  String? _formatDokanAddress(dynamic jsonData) {
    if (jsonData is! Map || jsonData.isEmpty) {
      return null;
    }

    var address = '';
    if (jsonData['street_1'] != null && jsonData['street_1'].isNotEmpty) {
      address = '${jsonData['street_1']}';
    }
    if (jsonData['street_2'] != null && jsonData['street_2'].isNotEmpty) {
      address = '$address, ${jsonData['street_2']}';
    }
    if (jsonData['city'] != null && jsonData['city'].isNotEmpty) {
      address = '$address, ${jsonData['city']}';
    }
    if (jsonData['state'] != null && jsonData['state'].isNotEmpty) {
      address = '$address, ${jsonData['state']}';
    }
    return address.trim();
  }

  // Format address from WCFM
  String? _formatWCFMAddress(String? address) {
    var addressFormat = '';
    var postCode = '';
    if (address == null || address.isEmpty) return addressFormat;

    var splitPostcode = address.split('-');
    var splitAddress = splitPostcode[0].split(',');

    if (splitPostcode.length > 1) {
      postCode = splitPostcode[1].trim();
    }
    if (splitAddress.isNotEmpty) {
      var newSplitAddress = splitAddress
          .map((e) => e.trim().replaceAll(RegExp(r'\s+'), ' '))
          .toList();
      newSplitAddress.removeWhere((address) => address.isEmpty);
      addressFormat = newSplitAddress.join(', ');
    }
    if (postCode.isNotEmpty) {
      if (addressFormat.isNotEmpty) {
        addressFormat += ' - $postCode';
      } else {
        addressFormat += postCode;
      }
    }

    return addressFormat;
  }

  // Get image, banner from dynamic data (String or bool or null)
  String? _parseImage(dynamic data) {
    if (data is String && data.isURL) {
      return data;
    }
    return null;
  }
}
