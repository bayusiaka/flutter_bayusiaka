import 'package:flutter_taskbloc/screen/screen_contact.dart';

abstract class ContactState {}

class InitiateContactState extends ContactState {}
class LoadingContactState extends ContactState {}
class FailedContactState extends ContactState {
  final String msg;

  FailedContactState({
    required this.msg,
  });
}

class SuccessContactState extends ContactState {
  final Contact data;

  SuccessContactState({
    required this.data,
  });
}

class EditContactState extends ContactState {
  final Contact data;
  final int index;

  EditContactState({
    required this.data,
    required this.index,
  });
}

class DeleteContactState extends ContactState {
  final int index;

  DeleteContactState({
    required this.index,
  });
}