abstract class GalleryState {}

class InitiateGalleryState extends GalleryState {}
class ShowGalleryState extends GalleryState {
  final String selectedImage;

  ShowGalleryState({
    required this.selectedImage,
  });
}