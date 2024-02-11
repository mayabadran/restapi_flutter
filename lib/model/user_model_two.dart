import 'dart:convert';

class AddressModel {
  String suite;
  String zipcode;
  AddressModel({
    required this.suite,
    required this.zipcode,
  });

  AddressModel copyWith({
    String? suite,
    String? zipcode,
  }) {
    return AddressModel(
      suite: suite ?? this.suite,
      zipcode: zipcode ?? this.zipcode,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'suite': suite});
    result.addAll({'zipcode': zipcode});
  
    return result;
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      suite: map['suite'] ?? '',
      zipcode: map['zipcode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source));

  @override
  String toString() => 'AddressModel(suite: $suite, zipcode: $zipcode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AddressModel &&
      other.suite == suite &&
      other.zipcode == zipcode;
  }

  @override
  int get hashCode => suite.hashCode ^ zipcode.hashCode;
}
