import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Event untuk gallery
abstract class GalleryEvent extends Equatable {
  const GalleryEvent();
}

class GalleryImageTapEvent extends GalleryEvent {
  final String imageUrl;

  GalleryImageTapEvent({required this.imageUrl});

  @override
  List<Object?> get props => [imageUrl];
}

// State untuk gallery
abstract class GalleryState extends Equatable {
  const GalleryState();
}

class GalleryInitialState extends GalleryState {
  @override
  List<Object?> get props => [];
}

class GalleryImageOpenedState extends GalleryState {
  final String imageUrl;

  GalleryImageOpenedState({required this.imageUrl});

  @override
  List<Object?> get props => [imageUrl];
}

// BLoC untuk gallery
class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc() : super(GalleryInitialState());

  @override
  Stream<GalleryState> mapEventToState(GalleryEvent event) async* {
    if (event is GalleryImageTapEvent) {
      yield GalleryImageOpenedState(imageUrl: event.imageUrl);
    }
  }
}
