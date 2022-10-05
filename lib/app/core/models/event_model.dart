import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:eventus/app/core/models/community_model.dart';
import 'package:eventus/app/core/models/question_model.dart';

class EventModel {
  final String? id;
  final CommunityModel? community;
  final bool? isPublic;
  final String? name;
  final String? description;
  final String? photo;
  final int? vacancies;
  final List<String>? participants;
  final Map<String, Question>? questions;

  final bool? isDeleted;
  EventModel({
    this.id,
    this.community,
    this.isPublic,
    this.name,
    this.description,
    this.photo,
    this.vacancies,
    this.participants,
    this.questions,
    this.isDeleted,
  });

  EventModel copyWith({
    String? id,
    CommunityModel? community,
    bool? isPublic,
    String? name,
    String? description,
    String? photo,
    int? vacancies,
    List<String>? participants,
    Map<String, Question>? questions,
    bool? isDeleted,
  }) {
    return EventModel(
      id: id ?? this.id,
      community: community ?? this.community,
      isPublic: isPublic ?? this.isPublic,
      name: name ?? this.name,
      description: description ?? this.description,
      photo: photo ?? this.photo,
      vacancies: vacancies ?? this.vacancies,
      participants: participants ?? this.participants,
      questions: questions ?? this.questions,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (community != null) {
      result.addAll({'community': community!.toMap()});
    }
    if (isPublic != null) {
      result.addAll({'isPublic': isPublic});
    }
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
    if (participants != null) {
      result.addAll({'participants': participants});
    }
    if (questions != null) {
      result.addAll({'questions': questions});
    }
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }

    return result;
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      community: map['community'] != null
          ? CommunityModel.fromMap(map['community'])
          : null,
      isPublic: map['isPublic'],
      name: map['name'],
      description: map['description'],
      photo: map['photo'],
      vacancies: map['vacancies']?.toInt(),
      participants: List<String>.from(map['participants']),
      questions: Map<String, Question>.from(map['questions']),
      isDeleted: map['isDeleted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventModel(id: $id, community: $community, isPublic: $isPublic, name: $name, description: $description, photo: $photo, vacancies: $vacancies, participants: $participants, questions: $questions, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventModel &&
        other.id == id &&
        other.community == community &&
        other.isPublic == isPublic &&
        other.name == name &&
        other.description == description &&
        other.photo == photo &&
        other.vacancies == vacancies &&
        listEquals(other.participants, participants) &&
        mapEquals(other.questions, questions) &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        community.hashCode ^
        isPublic.hashCode ^
        name.hashCode ^
        description.hashCode ^
        photo.hashCode ^
        vacancies.hashCode ^
        participants.hashCode ^
        questions.hashCode ^
        isDeleted.hashCode;
  }
}
