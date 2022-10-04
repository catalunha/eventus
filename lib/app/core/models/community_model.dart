import 'dart:convert';

/// Comunidade
class CommunityModel {
  final String? id;
  final String? name;
  final String? coordinator;
  final String? address;
  final bool? isDeleted;

  CommunityModel({
    this.id,
    this.name,
    this.coordinator,
    this.address,
    this.isDeleted,
  });

  CommunityModel copyWith({
    String? id,
    String? name,
    String? coordinator,
    String? address,
    bool? isDeleted,
  }) {
    return CommunityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      coordinator: coordinator ?? this.coordinator,
      address: address ?? this.address,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (coordinator != null) {
      result.addAll({'coordinator': coordinator});
    }
    if (address != null) {
      result.addAll({'address': address});
    }
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }

    return result;
  }

  factory CommunityModel.fromMap(Map<String, dynamic> map) {
    return CommunityModel(
      id: map['id'],
      name: map['name'],
      coordinator: map['coordinator'],
      address: map['address'],
      isDeleted: map['isDeleted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CommunityModel.fromJson(String source) =>
      CommunityModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommunityModel(id: $id, name: $name, coordinator: $coordinator, address: $address, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommunityModel &&
        other.id == id &&
        other.name == name &&
        other.coordinator == coordinator &&
        other.address == address &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        coordinator.hashCode ^
        address.hashCode ^
        isDeleted.hashCode;
  }
}
