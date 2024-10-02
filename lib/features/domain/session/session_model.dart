import 'package:flutter/material.dart';
import 'package:lawan/features/domain/arena/arena_model.dart';

class SessionModel {
  final ArenaModel arena;
  final int selectedCourt;
  final DateTime dateTime;
  final TimeOfDay startHour, endHour;
  final int totalHour;
  final String firstName, lastName, contactNumber, identificationNumber, price;

  SessionModel({
    required this.arena,
    required this.selectedCourt,
    required this.dateTime,
    required this.startHour,
    required this.endHour,
    required this.totalHour,
    required this.firstName,
    required this.lastName,
    required this.contactNumber,
    required this.identificationNumber,
    required this.price,
  });
}
