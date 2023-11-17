abstract class GalleryEvent {}

class OpenImageEvent extends GalleryEvent {
  final String imageUrl;

  OpenImageEvent({required this.imageUrl});
}
