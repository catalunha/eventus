import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:eventus/app/core/models/event_model.dart';
import 'package:eventus/app/core/models/person_model.dart';
import 'package:eventus/app/core/models/question_model.dart';
import 'package:eventus/app/core/models/user_model.dart';

/// Registro no evento
class ParticipantModel {
  final String? id;
  final EventModel event;
  final UserModel? user;
  final bool? forMe;
  final PersonModel? forMyPartner;
  final List<PersonModel> myChildren;
  final Map<String, QuestionModel> questions;
  final String? paymentVoucher;
  final String? pendencies;
  final bool? seePending;
  final bool? hasPending;
  final bool? isDeleted;

// seePending | hasPending
// false      | true
// true       | true
// false      | false
// Questions
// É a primeira vez que vc participa deste evento.

  ParticipantModel({
    this.id,
    required this.event,
    this.user,
    this.forMe,
    this.forMyPartner,
    required this.myChildren,
    required this.questions,
    this.paymentVoucher,
    this.pendencies,
    this.seePending,
    this.hasPending,
    this.isDeleted,
  });

  ParticipantModel copyWith({
    String? id,
    EventModel? event,
    UserModel? user,
    bool? forMe,
    PersonModel? forMyPartner,
    List<PersonModel>? myChildren,
    Map<String, QuestionModel>? questions,
    String? paymentVoucher,
    String? pendencies,
    bool? seePending,
    bool? hasPending,
    bool? isDeleted,
  }) {
    return ParticipantModel(
      id: id ?? this.id,
      event: event ?? this.event,
      user: user ?? this.user,
      forMe: forMe ?? this.forMe,
      forMyPartner: forMyPartner ?? this.forMyPartner,
      myChildren: myChildren ?? this.myChildren,
      questions: questions ?? this.questions,
      paymentVoucher: paymentVoucher ?? this.paymentVoucher,
      pendencies: pendencies ?? this.pendencies,
      seePending: seePending ?? this.seePending,
      hasPending: hasPending ?? this.hasPending,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'event': event.toMap()});
    if (user != null) {
      result.addAll({'user': user!.toMap()});
    }
    if (forMe != null) {
      result.addAll({'forMe': forMe});
    }
    if (forMyPartner != null) {
      result.addAll({'forMyPartner': forMyPartner!.toMap()});
    }
    result.addAll({'myChildren': myChildren.map((x) => x.toMap()).toList()});
    result.addAll({'questions': questions});
    if (paymentVoucher != null) {
      result.addAll({'paymentVoucher': paymentVoucher});
    }
    if (pendencies != null) {
      result.addAll({'pendencies': pendencies});
    }
    if (seePending != null) {
      result.addAll({'seePending': seePending});
    }
    if (hasPending != null) {
      result.addAll({'hasPending': hasPending});
    }
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }

    return result;
  }

  factory ParticipantModel.fromMap(Map<String, dynamic> map) {
    return ParticipantModel(
      id: map['id'],
      event: EventModel.fromMap(map['event']),
      user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
      forMe: map['forMe'],
      forMyPartner: map['forMyPartner'] != null
          ? PersonModel.fromMap(map['forMyPartner'])
          : null,
      myChildren: List<PersonModel>.from(
          map['myChildren']?.map((x) => PersonModel.fromMap(x))),
      questions: Map<String, QuestionModel>.from(map['questions']),
      paymentVoucher: map['paymentVoucher'],
      pendencies: map['pendencies'],
      seePending: map['seePending'],
      hasPending: map['hasPending'],
      isDeleted: map['isDeleted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ParticipantModel.fromJson(String source) =>
      ParticipantModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ParticipantModel(id: $id, event: $event, user: $user, forMe: $forMe, forMyPartner: $forMyPartner, myChildren: $myChildren, questions: $questions, paymentVoucher: $paymentVoucher, pendencies: $pendencies, seePending: $seePending, hasPending: $hasPending, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ParticipantModel &&
        other.id == id &&
        other.event == event &&
        other.user == user &&
        other.forMe == forMe &&
        other.forMyPartner == forMyPartner &&
        listEquals(other.myChildren, myChildren) &&
        mapEquals(other.questions, questions) &&
        other.paymentVoucher == paymentVoucher &&
        other.pendencies == pendencies &&
        other.seePending == seePending &&
        other.hasPending == hasPending &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        event.hashCode ^
        user.hashCode ^
        forMe.hashCode ^
        forMyPartner.hashCode ^
        myChildren.hashCode ^
        questions.hashCode ^
        paymentVoucher.hashCode ^
        pendencies.hashCode ^
        seePending.hashCode ^
        hasPending.hashCode ^
        isDeleted.hashCode;
  }
}
