part of 'public_bloc.dart';

sealed class PublicEvent {}

class PublicEventStarted extends PublicEvent {}

class PublicEventCreateCompany extends PublicEvent {}
