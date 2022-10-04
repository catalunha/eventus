import 'dart:convert';

import 'package:eventus/app/core/models/community_model.dart';
import 'package:flutter/foundation.dart';

class EventTypeModel {
  final String? id;
  final CommunityModel community;
  final String? name;
  final String? description;
  final String? photo;
  final int? vacancies;
  final List<String> recordedEvents;
  final bool? isDeleted;
  EventTypeModel({
    this.id,
    required this.community,
    this.name,
    this.description,
    this.photo,
    this.vacancies,
    required this.recordedEvents,
    this.isDeleted,
  });

  EventTypeModel copyWith({
    String? id,
    CommunityModel? community,
    String? name,
    String? description,
    String? photo,
    int? vacancies,
    List<String>? recordedEvents,
    bool? isDeleted,
  }) {
    return EventTypeModel(
      id: id ?? this.id,
      community: community ?? this.community,
      name: name ?? this.name,
      description: description ?? this.description,
      photo: photo ?? this.photo,
      vacancies: vacancies ?? this.vacancies,
      recordedEvents: recordedEvents ?? this.recordedEvents,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'community': community.toMap()});
    if (name != null) {
      result.addAll({'name': name});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (photo != null) {
      result.addAll({'photo': photo});
    }
    if (vacancies != null) {
      result.addAll({'vacancies': vacancies});
    }
    result.addAll({'recordedEvents': recordedEvents});
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }

    return result;
  }

  factory EventTypeModel.fromMap(Map<String, dynamic> map) {
    return EventTypeModel(
      id: map['id'],
      community: CommunityModel.fromMap(map['community']),
      name: map['name'],
      description: map['description'],
      photo: map['photo'],
      vacancies: map['vacancies']?.toInt(),
      recordedEvents: List<String>.from(map['recordedEvents']),
      isDeleted: map['isDeleted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EventTypeModel.fromJson(String source) =>
      EventTypeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventTypeModel(id: $id, community: $community, name: $name, description: $description, photo: $photo, vacancies: $vacancies, recordedEvents: $recordedEvents, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventTypeModel &&
        other.id == id &&
        other.community == community &&
        other.name == name &&
        other.description == description &&
        other.photo == photo &&
        other.vacancies == vacancies &&
        listEquals(other.recordedEvents, recordedEvents) &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        community.hashCode ^
        name.hashCode ^
        description.hashCode ^
        photo.hashCode ^
        vacancies.hashCode ^
        recordedEvents.hashCode ^
        isDeleted.hashCode;
  }
}
