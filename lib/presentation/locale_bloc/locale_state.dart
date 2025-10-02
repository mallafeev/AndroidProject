import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LocaleState extends Equatable {
  final Locale currentLocale;

  const LocaleState({required this.currentLocale});

  @override
  List<Object?> get props => [currentLocale];

  LocaleState copyWith({Locale? currentLocale }) => LocaleState(currentLocale: currentLocale ?? this.currentLocale);
  //вместо g файла
}