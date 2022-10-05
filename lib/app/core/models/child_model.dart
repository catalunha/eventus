import 'dart:convert';

import 'package:eventus/app/core/models/community_model.dart';

// Perfil da criança
class ChildModel {
  final String? id;
  final CommunityModel community;
  final String? email;
  final String? name;
  final String? phone;
  final String? photo;
  final String? cpf;
  final bool? isFemale;
  final DateTime? birthday;
  final String? description;
  final bool? isDeleted;
  ChildModel({
    this.id,
    required this.community,
    this.email,
    this.name,
    this.phone,
    this.photo,
    this.cpf,
    this.isFemale,
    this.birthday,
    this.description,
    this.isDeleted,
  });

  ChildModel copyWith({
    String? id,
    CommunityModel? community,
    String? email,
    String? name,
    String? phone,
    String? photo,
    String? cpf,
    bool? isFemale,
    DateTime? birthday,
    String? description,
    bool? isDeleted,
  }) {
    return ChildModel(
      id: id ?? this.id,
      community: community ?? this.community,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      photo: photo ?? this.photo,
      cpf: cpf ?? this.cpf,
      isFemale: isFemale ?? this.isFemale,
      birthday: birthday ?? this.birthday,
      description: description ?? this.description,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'community': community.toMap()});
    if (email != null) {
      result.addAll({'email': email});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (photo != null) {
      result.addAll({'photo': photo});
    }
    if (cpf != null) {
      result.addAll({'cpf': cpf});
    }
    if (isFemale != null) {
      result.addAll({'isFemale': isFemale});
    }
    if (birthday != null) {
      result.addAll({'birthday': birthday!.millisecondsSinceEpoch});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }

    return result;
  }

  factory ChildModel.fromMap(Map<String, dynamic> map) {
    return ChildModel(
      id: map['id'],
      community: CommunityModel.fromMap(map['community']),
      email: map['email'],
      name: map['name'],
      phone: map['phone'],
      photo: map['photo'],
      cpf: map['cpf'],
      isFemale: map['isFemale'],
      birthday: map['birthday'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['birthday'])
          : null,
      description: map['description'],
      isDeleted: map['isDeleted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChildModel.fromJson(String source) =>
      ChildModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChildModel(id: $id, community: $community, email: $email, name: $name, phone: $phone, photo: $photo, cpf: $cpf, isFemale: $isFemale, birthday: $birthday, description: $description, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChildModel &&
        other.id == id &&
        other.community == community &&
        other.email == email &&
        other.name == name &&
        other.phone == phone &&
        other.photo == photo &&
        other.cpf == cpf &&
        other.isFemale == isFemale &&
        other.birthday == birthday &&
        other.description == description &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        community.hashCode ^
        email.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        photo.hashCode ^
        cpf.hashCode ^
        isFemale.hashCode ^
        birthday.hashCode ^
        description.hashCode ^
        isDeleted.hashCode;
  }
}
