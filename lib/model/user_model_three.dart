import 'dart:convert';

class GeoModel {
  String lat;
  String lng;
  GeoModel({
    required this.lat,
    required this.lng,
  });
  

  GeoModel copyWith({
    String? lat,
    String? lng,
  }) {
    return GeoModel(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'lat': lat});
    result.addAll({'lng': lng});
  
    return result;
  }

  factory GeoModel.fromMap(Map<String, dynamic> map) {
    return GeoModel(
      lat: map['lat'] ?? '',
      lng: map['lng'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GeoModel.fromJson(String source) => GeoModel.fromMap(json.decode(source));

  @override
  String toString() => 'GeoModel(lat: $lat, lng: $lng)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GeoModel &&
      other.lat == lat &&
      other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}
