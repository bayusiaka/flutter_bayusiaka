import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taskbloc/bloc/gallery/gallery_event.dart';
import 'package:flutter_taskbloc/bloc/gallery/gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc() : super(InitiateGalleryState()) {
    on<AddGalleryEvent>(((event, emit) {
      emit(ShowGalleryState(
        selectedImage: event.selectedImage,
      ));
    }));
  }
}
