abstract class GalleryState {}

class GalleryInitialState extends GalleryState {}

class GalleryImageOpenedState extends GalleryState {
  final String imageUrl;

  GalleryImageOpenedState({required this.imageUrl});
}
