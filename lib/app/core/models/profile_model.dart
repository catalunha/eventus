import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:eventus/app/core/models/community_model.dart';
import 'package:eventus/app/core/models/person_model.dart';

// Perfil de usuario ou pessoa
class ProfileModel {
  final String? id;
  final String? email;
  final String? name;
  final String? phone;
  final String? address;
  final String? cep;
  final String? pluscode;
  final String? photo;
  final String? cpf;
  final bool? isFemale;
  final DateTime? birthday;
  final String? description;
  final PersonModel? partner;
  final List<PersonModel>? children;

  final CommunityModel? community;
  final bool? isActive;
  final List<String>? routes;
  ProfileModel({
    this.id,
    this.email,
    this.name,
    this.phone,
    this.address,
    this.cep,
    this.pluscode,
    this.photo,
    this.cpf,
    this.isFemale,
    this.birthday,
    this.description,
    this.partner,
    this.children,
    this.community,
    this.isActive,
    this.routes,
  });

  ProfileModel copyWith({
    String? id,
    String? email,
    String? name,
    String? phone,
    String? address,
    String? cep,
    String? pluscode,
    String? photo,
    String? cpf,
    bool? isFemale,
    DateTime? birthday,
    String? description,
    PersonModel? partner,
    List<PersonModel>? children,
    CommunityModel? community,
    bool? isActive,
    List<String>? routes,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      cep: cep ?? this.cep,
      pluscode: pluscode ?? this.pluscode,
      photo: photo ?? this.photo,
      cpf: cpf ?? this.cpf,
      isFemale: isFemale ?? this.isFemale,
      birthday: birthday ?? this.birthday,
      description: description ?? this.description,
      partner: partner ?? this.partner,
      children: children ?? this.children,
      community: community ?? this.community,
      isActive: isActive ?? this.isActive,
      routes: routes ?? this.routes,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (address != null) {
      result.addAll({'address': address});
    }
    if (cep != null) {
      result.addAll({'cep': cep});
    }
    if (pluscode != null) {
      result.addAll({'pluscode': pluscode});
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
    if (partner != null) {
      result.addAll({'partner': partner!.toMap()});
    }
    if (children != null) {
      result.addAll({'children': children!.map((x) => x.toMap()).toList()});
    }
    if (community != null) {
      result.addAll({'community': community!.toMap()});
    }
    if (isActive != null) {
      result.addAll({'isActive': isActive});
    }
    if (routes != null) {
      result.addAll({'routes': routes});
    }

    return result;
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      phone: map['phone'],
      address: map['address'],
      cep: map['cep'],
      pluscode: map['pluscode'],
      photo: map['photo'],
      cpf: map['cpf'],
      isFemale: map['isFemale'],
      birthday: map['birthday'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['birthday'])
          : null,
      description: map['description'],
      partner:
          map['partner'] != null ? PersonModel.fromMap(map['partner']) : null,
      children: map['children'] != null
          ? List<PersonModel>.from(
              map['children']?.map((x) => PersonModel.fromMap(x)))
          : null,
      community: map['community'] != null
          ? CommunityModel.fromMap(map['community'])
          : null,
      isActive: map['isActive'],
      routes: List<String>.from(map['routes']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfileModel(id: $id, email: $email, name: $name, phone: $phone, address: $address, cep: $cep, pluscode: $pluscode, photo: $photo, cpf: $cpf, isFemale: $isFemale, birthday: $birthday, description: $description, partner: $partner, children: $children, community: $community, isActive: $isActive, routes: $routes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileModel &&
        other.id == id &&
        other.email == email &&
        other.name == name &&
        other.phone == phone &&
        other.address == address &&
        other.cep == cep &&
        other.pluscode == pluscode &&
        other.photo == photo &&
        other.cpf == cpf &&
        other.isFemale == isFemale &&
        other.birthday == birthday &&
        other.description == description &&
        other.partner == partner &&
        listEquals(other.children, children) &&
        other.community == community &&
        other.isActive == isActive &&
        listEquals(other.routes, routes);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        address.hashCode ^
        cep.hashCode ^
        pluscode.hashCode ^
        photo.hashCode ^
        cpf.hashCode ^
        isFemale.hashCode ^
        birthday.hashCode ^
        description.hashCode ^
        partner.hashCode ^
        children.hashCode ^
        community.hashCode ^
        isActive.hashCode ^
        routes.hashCode;
  }
}
