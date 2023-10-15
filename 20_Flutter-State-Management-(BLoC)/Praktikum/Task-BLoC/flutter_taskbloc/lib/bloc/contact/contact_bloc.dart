import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(InitiateContactState()) {
    on<SubmitContactEvent>(((event, emit) {
      emit(LoadingContactState());
      emit(SuccessContactState(
        data: event.data,
      ));
    }));

    on<EditContactEvent>(((event, emit) {
      emit(EditContactState(
        data: event.data,
        index: event.index,
      ));
    }));

    on<DeleteContactEvent>(((event, emit) {
      emit(DeleteContactState(
        index: event.index,
      ));
    }));
  }
}