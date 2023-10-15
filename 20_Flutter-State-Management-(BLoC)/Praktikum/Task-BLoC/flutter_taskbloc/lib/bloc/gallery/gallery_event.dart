abstract class GalleryEvent {}

class AddGalleryEvent extends GalleryEvent {
  final String selectedImage;

  AddGalleryEvent({
    required this.selectedImage
  });
}