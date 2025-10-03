
class PlaceModel {
  List<dynamic>? htmlAttributions;
  Result? result;
  String? status;

  PlaceModel({
    this.htmlAttributions,
    this.result,
    this.status,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
    htmlAttributions: json["html_attributions"] == null ? [] : List<dynamic>.from(json["html_attributions"]!.map((x) => x)),
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "html_attributions": htmlAttributions == null ? [] : List<dynamic>.from(htmlAttributions!.map((x) => x)),
    "result": result?.toJson(),
    "status": status,
  };
}

class Result {
  List<AddressComponent>? addressComponents;
  String? adrAddress;
  String? formattedAddress;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  String? placeId;
  PlusCode? plusCode;
  String? reference;
  List<String>? types;
  String? url;
  int? utcOffset;
  String? vicinity;

  Result({
    this.addressComponents,
    this.adrAddress,
    this.formattedAddress,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name,
    this.placeId,
    this.plusCode,
    this.reference,
    this.types,
    this.url,
    this.utcOffset,
    this.vicinity,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    addressComponents: json["address_components"] == null ? [] : List<AddressComponent>.from(json["address_components"]!.map((x) => AddressComponent.fromJson(x))),
    adrAddress: json["adr_address"],
    formattedAddress: json["formatted_address"],
    geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
    icon: json["icon"],
    iconBackgroundColor: json["icon_background_color"],
    iconMaskBaseUri: json["icon_mask_base_uri"],
    name: json["name"],
    placeId: json["place_id"],
    plusCode: json["plus_code"] == null ? null : PlusCode.fromJson(json["plus_code"]),
    reference: json["reference"],
    types: json["types"] == null ? [] : List<String>.from(json["types"]!.map((x) => x)),
    url: json["url"],
    utcOffset: json["utc_offset"],
    vicinity: json["vicinity"],
  );

  Map<String, dynamic> toJson() => {
    "address_components": addressComponents == null ? [] : List<dynamic>.from(addressComponents!.map((x) => x.toJson())),
    "adr_address": adrAddress,
    "formatted_address": formattedAddress,
    "geometry": geometry?.toJson(),
    "icon": icon,
    "icon_background_color": iconBackgroundColor,
    "icon_mask_base_uri": iconMaskBaseUri,
    "name": name,
    "place_id": placeId,
    "plus_code": plusCode?.toJson(),
    "reference": reference,
    "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
    "url": url,
    "utc_offset": utcOffset,
    "vicinity": vicinity,
  };
}

class AddressComponent {
  String? longName;
  String? shortName;
  List<String>? types;

  AddressComponent({
    this.longName,
    this.shortName,
    this.types,
  });

  factory AddressComponent.fromJson(Map<String, dynamic> json) => AddressComponent(
    longName: json["long_name"],
    shortName: json["short_name"],
    types: json["types"] == null ? [] : List<String>.from(json["types"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "long_name": longName,
    "short_name": shortName,
    "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
  };
}

class Geometry {
  Location? location;
  Viewport? viewport;

  Geometry({
    this.location,
    this.viewport,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    viewport: json["viewport"] == null ? null : Viewport.fromJson(json["viewport"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "viewport": viewport?.toJson(),
  };
}

class Location {
  double? lat;
  double? lng;

  Location({
    this.lat,
    this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Viewport {
  Location? northeast;
  Location? southwest;

  Viewport({
    this.northeast,
    this.southwest,
  });

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
    northeast: json["northeast"] == null ? null : Location.fromJson(json["northeast"]),
    southwest: json["southwest"] == null ? null : Location.fromJson(json["southwest"]),
  );

  Map<String, dynamic> toJson() => {
    "northeast": northeast?.toJson(),
    "southwest": southwest?.toJson(),
  };
}

class PlusCode {
  String? globalCode;

  PlusCode({
    this.globalCode,
  });

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
    globalCode: json["global_code"],
  );

  Map<String, dynamic> toJson() => {
    "global_code": globalCode,
  };
}
