import 'package:flutter_taskbloc/screen/screen_contact.dart';

abstract class ContactEvent {}
class SubmitContactEvent extends ContactEvent {
  final Contact data;

  SubmitContactEvent({
    required this.data,
  });
}

class EditContactEvent extends ContactEvent {
  final Contact data;
  final int index;

  EditContactEvent({
    required this.data,
    required this.index,
  });
}

class DeleteContactEvent extends ContactEvent {
  final int index;

  DeleteContactEvent({
    required this.index,
  });
}